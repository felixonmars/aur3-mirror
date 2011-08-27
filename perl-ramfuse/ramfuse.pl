#!/usr/bin/perl
use File::Basename;

unshift @INC, dirname($0);
require Fuse::InMemory;

my $fs = Fuse::InMemory->new();
$fs->main();

=head1 NAME

ramfuse.pl - RAM disk filesystem in userspace

=head1 SYNOPSIS

    perl ramfuse.pl /mnt
    perl ramfuse.pl /mnt --debug -o ' '

=head1 DESCRIPTION

This is a RAM disk running in user space, implemented using FUSE and the perl Fuse module.

It grows dynamically, no special configuration is necessary. On operating systems other than
Mac OS X, ramfuse tries to grant other users access to the file system and enables default
permission checking. This can be turned off by specifying own options that supercede the
default mount options, e.g. by specifying -o ' ' as arguments.

=head1 CAVEATS

The perl interpreter never releases any memory. Therefore, removing or truncating files will
not make the memory used by them available to other processes - but it will be re-used by
ramfuse itself.

=head1 AUTHOR

Daniel Fischer, E<lt>df@erinye.comE<gt>

=cut
