package Fuse::InMemory;
use Getopt::Long;
use Fuse  ':xattr';
use Errno ':POSIX';
use Fcntl ':mode';

# create a new instance
sub new {
    my $class = shift;
    my $self = bless { 
        'root'      => Fuse::InMemory::File->new(
                             'path' => '/',
                             'mode' => S_IFDIR|0755,
                       ),
    }, $class;
    return $self;
}

# enter the main loop
sub main {
    my ($self, @args) = @_;
    local @ARGV = @args if @args;
    # default arguments
    my %fuse_args = (
        'debug'     => 0,
        'mountopts' => 'default_permissions,allow_other',
    );
    # specified arguments supercede the defaults
    GetOptions(
        'debug' => \$fuse_args{'debug'},
        'o=s'   => \$fuse_args{'mountopts'},
    ) or Getopt::Long::HelpMessage(2);
    $fuse_args{'mountpoint'} = shift @ARGV unless defined $fuse_args{'mountpoint'};
    # install Fuse callbacks
    for my $f (keys %{*{'Fuse::InMemory::'}}) {
        if($f =~ /^fuse_([a-z]+)$/) {
            $fuse_args{$1} = eval 'sub { my $before = $self->check_before("'.$1.'", @_); return $before if defined $before; return $self->check_after("'.$1.'",$self->fuse_'.$1.'(@_)); }';
        }
    }
    # run Fuse main loop
    Fuse::main(%fuse_args);
}

# run the before filter if there is one
sub check_before() {
    my ($self, $cb, @args) = @_;
    my $check = $self->{'before_'.$cb};
    return $check->($self, $cb, @args) if ref $check;
    return undef;
}

# run the after filter if there is one
sub check_after() {
    my ($self, $cb, @args) = @_;
    my $check = $self->{'after_'.$cb};
    return $check->($self, $cb, @args) if ref $check;
    return $args[0] unless wantarray;
    return @args;
}

# locate a file object by path name, optionally create it if a replacement is specified
sub find_file {
    my ($self, $filename, $replacement) = @_;
    my $res = $self->{'root'};
    my $last = undef;

    my @parts = split /\//, $filename;
    while(@parts) {
        my $dir = shift @parts;
        next if $dir eq '';
        return -ENOENT() unless ref $res;
        return -ENOTDIR() unless $res->is_directory();
        $last = $res;
        $res = $res->get_file($dir);
    }
    if(defined $replacement && !ref $res && defined $last) {
        $res = $replacement;
        $last->add_file($res);
    }
    $res = Fuse::InMemory::File->new(path => $filename, exists => 0) unless ref $res;
    return $res;
}

# add magic to a file by path name
sub add_magic {
    my($self, $filename, $reader, $writer, $truncater, $flusher) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    $file->{'reader'} = $reader;
    $file->{'writer'} = $writer;
    $file->{'flusher'} = $flusher;
    $file->{'truncater'} = $truncater;
    return 0;
}

# getattr callback
sub fuse_getattr {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
#    print "getattr $filename\n";
#    $file->{'open'}++;
#    $file->flush();
#    $file->{'open'}--;
    my @ret = $file->getattr();
    return @ret;
}

# readlink callback
sub fuse_readlink {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    my $ret = $file->is_symlink();
    $ret = -EINVAL() unless $ret;
    return $ret;
}

# getdir callback
sub fuse_getdir {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOTDIR() unless $file->is_directory();
    return $file->getdir();
}

# mknod callback
sub fuse_mknod {
    my ($self, $filename, $mode, $device) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -EEXIST() if $file->exists();
    $file->create($self);
    return 0;
}

# mkdir callback
sub fuse_mkdir {
    my ($self, $filename, $mode) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -EEXIST() if $file->exists();
    $file->set_mode(S_IFDIR | $mode);
    $file->create($self);
    return 0;
}

# unlink callback
sub fuse_unlink {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
    $file->flush();
    $file->remove($self);
    return 0;
}

# rmdir callback
sub fuse_rmdir {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
    return -ENOTDIR() unless $file->is_directory();
    return -ENOTEMPTY() unless $file->is_empty();
    $file->remove($self);
    return 0;
}

# symlink callback
sub fuse_symlink {
    my ($self, $filename, $linkname) = @_;
    my $file = $self->find_file($linkname);
    return $file unless ref $file;
    return -EEXIST() if $file->exists();
    $file->make_symlink($filename);
    $file->create($self);
    return 0;
}

# rename callback
sub fuse_rename {
    my ($self, $filename, $newname) = @_;
    my $file = $self->find_file($filename);
    my $newn = $self->find_file($newname);
    return $file unless ref $file;
    return $newn unless ref $newn;
    return -EEXIST() if $newn->exists();
    $file->moved($newname);
    $self->find_file($newname, $file);
    return 0;
}

# link callback
sub fuse_link {
    my ($self, $filename, $linkname) = @_;
    my $file = $self->find_file($linkname);
    my $dest = $self->find_file($filename);
    return $file unless ref $file;
    return $dest unless ref $dest;
    return -EEXIST() if $file->exists();
    return -EPERM() unless $dest->exists();
    $file->create($self);
    return $file->make_hardlink($dest);
}

# chmod callback
sub fuse_chmod {
    my ($self, $filename, $mode) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return $file->chmod($mode);
}

# chown callback
sub fuse_chown {
    my ($self, $filename, $uid, $gid) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return $file->chown($uid, $gid);
}

# truncate callback
sub fuse_truncate {
    my ($self, $filename, $offset) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
    return $file->truncate();
}

# utime callback
sub fuse_utime {
    my ($self, $filename, $atime, $mtime) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
    $file->set_amtime($atime, $mtime);
    return 0;
}

# open callback
sub fuse_open {
    my ($self, $filename, $flags) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -ENOENT() unless $file->exists();
    $file->{'open'} = 1;
    $file->flush();
    return 0;
}

# read callback
sub fuse_read {
    my ($self, $filename, $size, $offset) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return $file->read($size, $offset);
}

# write callback
sub fuse_write {
    my ($self, $filename, $buffer, $offset) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return $file->write($buffer, $offset);
}

# statfs callback
sub fuse_statfs {
    my ($self) = @_;
    return (0, 1, 1, 1, 1, 1);
    # return $namelen, $files, $files_free, $blocks, $blocks_avail, $blocksize
    # return -ENOSYS();
}

# flush callback
sub fuse_flush {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    $file->flush() if ref $file;
    return 0;
}

# release callback
sub fuse_release {
    my ($self, $filename, $flags) = @_;
    my $file = $self->find_file($filename);
    $file->{'open'} = 0;
    $file->flush() if ref $file;
    return 0;
}

# fsync callback
sub fuse_fsync {
    my ($self, $filename, $flags) = @_;
    my $file = $self->find_file($filename);
    $file->flush() if ref $file;
    return 0;
}

# setxattr callback
sub fuse_setxattr {
    my ($self, $filename, $ext_name, $ext_val, $flags) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return -EEXIST() if ($flags & XATTR_CREATE()) && exists $file->{'xattr'}->{$ext_name};
#    return -ENOATTR() if ($flags & XATTR_REPLACE()) && exists $file->{'xattr'}->{$ext_name};
    $ext_val = 0 unless defined $ext_val;
    $file->{'xattr'}->{$ext_name} = $ext_val;
    return 0;
}

# getxattr callback
sub fuse_getxattr {
    my ($self, $filename, $ext_name) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
#    return -ENOATTR() unless exists $file->{'xattr'}->{$ext_name};
    return $file->{'xattr'}->{$ext_name};
}

# listxattr callback
sub fuse_listxattr {
    my ($self, $filename) = @_;
    my $file = $self->find_file($filename);
    return $file unless ref $file;
    return (keys %{$file->{'xattr'}}), 0;
}

# removexattr callback
sub fuse_removexattr {
    my ($self, $filename, $ext_name) = @_;
    delete $file->{'xattr'}->{$ext_name};
    return 0;
}

# class representing a single file or directory
package Fuse::InMemory::File;
use Errno qw / :POSIX /;
use Fcntl ':mode';

# create a new instance with sensible defaults
sub new {
    my $class = shift;
    my $time = time();
    my $tmp = '';
    my $self = { 
        'exists' => 1,    # zero if only a temporary file object
        'data' => \$tmp,  # reference to empty scalar var for contents of the file
        'attr' => [       # file attributes
            0,            # device number of file system
            0,            # inode number
            S_IFREG|0644, # file mode
            1,            # number of hard links to this file
            $>,           # user ID of owner
            $)+0,         # group ID of owner
            0,            # device identifier for special nodes
            0,            # size in bytes
            $time,        # atime
            $time,        # mtime
            $time,        # ctime
            512,          # blksize
            1,            # blocks
        ],
        'xattr' => {      # extended attributes
        },
    };
    # copy arguments
    while(my $a = shift) {
        last if !defined $a;
        my $b = shift;
        if($a eq 'mode') {
            $self->{'attr'}->[2] = $b;
        } else {
            $self->{$a} = $b;
        }
    }
    return bless $self, $class;
}

# read $size bytes from $offset
sub read {
    my ($self, $size, $offset) = @_;
    return '' if $offset >= $self->{'attr'}->[7];
    my $diff = $offset + $size - $self->{'attr'}->[7];
    $size -= $diff if $diff > 0;
    if($self->{'reader'}) {
        # apply magic
        return $self->{'reader'}->($self, $size, $offset);
    } else {
        return substr(${$self->{'data'}}, $offset, $size);
    }
}

# write $buffer to $offset in this file
sub write {
    my ($self, $buffer, $offset) = @_;
    if($self->{'writer'}) {
        # apply magic
        return $self->{'writer'}->($self, $buffer, $offset);
    } else {
        my $extend = $offset - length(${$self->{'data'}});
        ${$self->{'data'}} .= (' ' x $extend) if $extend > 0;
        substr(${$self->{'data'}}, $offset, length($buffer)) = $buffer;
        $self->set_size(length(${$self->{'data'}}));
        return length($buffer);
    }
}

# truncate this file
sub truncate {
    my ($self, $buffer, $offset) = @_;
    if($self->{'truncater'}) {
        # apply magic
        return $self->{'truncater'}->($self);
    } else {
        if($self->{'attr'}->[3] <= 1) {
            # if only one link, create new scalar for contents, saves memory
            my $tmp = '';
            $self->{'data'} = \$tmp;
        } else {
            substr(${$self->{'data'}},0) = '';
        }
        $self->set_size(0);
        return 0;
    }
}

# flush 
sub flush {
    my ($self) = @_;
    if($self->{'flusher'}) {
        # apply magic
        $self->{'flusher'}->($self);
    }
}

# return the path of this file
sub path {
    my ($self) = @_;
    return $self->{'path'};
}

# return the name of this file only
sub filename {
    my ($self) = @_;
    my $p = $self->{'path'};
    $p =~ s/.*\///;
    return $p;
}

# return true if this file actually exists
sub exists {
    my ($self) = @_;
    return $self->{'exists'};
}

# set the size of this file to $size
sub set_size {
    my ($self, $size) = @_;
    $self->{'attr'}->[7] = $size;
    $self->flush();
    return $size;
}

# set the mode of this file to $mode
sub set_mode {
    my ($self, $mode) = @_;
    $self->{'attr'}->[2] = $mode;
    $self->flush();
    return $mode;
}

# set the permissions of this file to $mode
sub chmod {
    my ($self, $mode) = @_;
    $self->{'attr'}->[2] = ($self->{'attr'}->[2] & S_IFMT()) | $mode;
    $self->flush();
    return 0;
}

# set owner of this file to $uid and group to $gid
sub chown {
    my ($self, $uid, $gid) = @_;
    $self->{'attr'}->[4] = $uid;
    $self->{'attr'}->[5] = $gid;
    $self->flush();
    return 0;
}

# set atime to $atime and mtime to $mtime
sub set_amtime {
    my ($self, $atime, $mtime) = @_;
    $self->{'attr'}->[8] = $atime;
    $self->{'attr'}->[9] = $mtime;
    $self->flush();
}

# make this file into a symlink pointing to $dest
sub make_symlink {
    my ($self, $dest) = @_;
    $self->{'attr'}->[2] = S_IFLNK|0777;
    $self->{'symlink'} = $dest;
    $self->flush();
}

# make this file into a hard link pointing to $dest
# destination must be within the same file system
sub make_hardlink {
    my ($self, $dest) = @_;
    $self->{'attr'} = $dest->{'attr'};
    $self->{'data'} = $dest->{'data'};
    $self->{'xattr'} = $dest->{'xattr'};
    $self->{'attr'}->[3]++;
    $self->flush();
}

# return true if this file is actually a symlink
sub is_symlink {
    my ($self) = @_;
    return $self->{'symlink'} if ($self->{'attr'}->[2] & S_IFLNK) != 0;
    return 0;
}

# return true if this file is a directory
sub is_directory {
    my ($self) = @_;
    return ($self->{'attr'}->[2] & S_IFDIR) != 0;
}

# return true if this is a directory and also empty
sub is_empty {
    my ($self) = @_;
    return -ENOTDIR() unless $self->is_directory();
    $self->flush();
    $self->{'contents'} = {} unless exists $self->{'contents'};
    return 0 if scalar(keys %{$self->{'contents'}}) > 0;
    return 1;
}

# remove the child $child from this directory
sub remove_child {
    my ($self, $child) = @_;
    return -ENOTDIR() unless $self->is_directory();
    $self->{'contents'} = {} unless exists $self->{'contents'};
    delete $self->{'contents'}->{$child->filename()};    
    $self->flush();
    return 0;
}

# get the file identified by name $file within this directory
sub get_file {
    my ($self, $file) = @_;
    return undef unless $self->is_directory();
    $self->flush();
    $self->{'contents'} = {} unless exists $self->{'contents'};
    my $ret = $self->{'contents'}->{$file};
    return -ENOENT() unless defined $ret;
    return $ret;
}

# add the file $file to this directory
sub add_file {
    my ($self, $file) = @_;
    $self->{'contents'}->{$file->filename()} = $file;
    $file->{'parent'} = $self;
    $self->flush();
}

# return the list of this directory's contents plus . and ..
sub getdir {
    my ($self) = @_;
    return undef unless $self->is_directory();
    $self->flush();
    return '.', '..', keys %{$self->{'contents'}}, 0;
}

# create this file and put it into the file system $fs
sub create {
    my ($self, $fs) = @_;
    $fs->find_file($self->{'path'}, $self);
    $self->{'exists'} = 1;
}

# remove this file
sub remove {
    my ($self, $fs) = @_;
    $self->{'exists'} = 0;
    $self->{'attr'}->[3]--;
    $self->{'parent'}->remove_child($self);
    $self->truncate() if $self->{'attr'}->[3] < 1;
    $self->flush();
}

# do stuff necessary after this file was moved about in the file system, $name contains the new path
sub moved {
    my ($self, $name) = @_;
    $self->{'parent'}->remove_child($self);
    $self->{'path'} = $name;
    $self->flush();
}

# return the attributes of this file
sub getattr {
    my ($self) = @_;
    $self->flush();
    my @ret = @{$self->{'attr'}};
    if($self->is_directory()) {
        # nlink is 1 + number of subdirectories for directories
        $ret[3] += scalar(keys %{$self->{'contents'}});
    }
    return @ret;
}

1;
__END__

=head1 NAME

Fuse::InMemory - extensible RAM file system

=head1 SYNOPSIS

    use Fuse::InMemory;
    my $fs = Fuse::InMemory->new();
    $fs->main();

=head1 DESCRIPTION

This is a complete RAM file system written in perl, using Fuse.
By default, all file content is kept in scalar buffers. Attributes
and extended attributes are stored separately, and mostly
supported. This means you can use chmod, chown, setfacl and all
that on files in this file system, although the usual restrictions
on permissions apply - i.e. for example, if you disable permission
checking, you can create a setuid-root executable as a normal user,
but when you run it, it won't run with root privileges.

=head2 EXPORTED SYMBOLS

None.

=head2 CLASS METHODS

=head3 new()

Creates a new RAM file system.

    my $fs = Fuse::InMemory->new();

=head2 INSTANCE METHODS

=head3 main([arguments])

Configures the file system and enters the Fuse main loop.
When run without arguments, options will be taken from the
command line. This includes the mount point.

    $fs->main();

It is also possible to pass a list of arguments to main, to be
used instead of the command line:

    $fs->main(@my_args);

or

    $fs->main('/mnt', '-o', '');

=head3 add_magic(file,reader,writer,truncater,flusher)

Add magic to a file. The file must already exist and is 
identified by its full path within the mounted file system.
All remaining arguments are coderefs.

=head1 AUTHOR

Daniel Fischer, E<lt>df@erinye.comE<gt>

=head1 SEE ALSO

L<Fuse>

=cut
