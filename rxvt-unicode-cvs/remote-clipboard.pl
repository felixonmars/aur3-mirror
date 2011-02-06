#!perl
use Fcntl ();

sub msg {
	my ($self, $msg) = @_;
	my $overlay = $self->overlay (-1, 0, $self->strwidth ($msg), 1, urxvt::OVERLAY_RSTYLE, 0);
	$overlay->set (0, 0, $msg);
	$self->{msg} = urxvt::timer->new->after (2)->cb (sub { delete $self->{msg}; undef $overlay; });
}

sub store {
	my ($self) = @_;

	eval {
		local %ENV = %{ $self->env };
		if (my $pid = open my $fh, "|-:utf8", $self->{store_cmd}) {
			fcntl $fh, &Fcntl::F_SETFL, &Fcntl::O_NONBLOCK;
			$self->{iow} = urxvt::iow->new->fd (fileno $fh)->events (urxvt::EV_WRITE)->start->cb (sub {
				my $txt = $self->selection;
				my $len = syswrite $fh, $txt;
				delete $self->{iow};
				$self->msg ($len);
			});
		}
	}
}

sub fetch {
	my ($self) = @_;

	eval {
		local %ENV = %{ $self->env };
		if (my $pid = open my $fh, "-|:utf8", $self->{fetch_cmd}) {
			fcntl $fh, &Fcntl::F_SETFL, &Fcntl::O_NONBLOCK;
			$self->{iow} = urxvt::iow->new->fd (fileno $fh)->events (urxvt::EV_READ)->start->cb (sub {
				my $txt;
				my $len = sysread $fh, $txt, 8192;
				delete $self->{iow};
				$self->selection_clear;
				$self->selection ($txt);
				$self->selection_grab (urxvt::CurrentTime);
				$self->msg ($len);
				utf8::decode ($txt);
				$self->tt_write ($self->locale_encode ($txt));
			});
		}
	}
}

sub on_start {
	my ($self) = @_;

	$self->{store_cmd} = $self->x_resource ("remote-selection.store") || "cat >/tmp/distributed-selection";
	$self->{fetch_cmd} = $self->x_resource ("remote-selection.fetch") || "cat /tmp/distributed-selection";

	()
}

sub on_user_command {
	my ($self, $cmd) = @_;

	if ($cmd eq "clipboard:copy") {
		$self->store;
	} elsif ($cmd eq "clipboard:paste") {
		$self->fetch;
	}

	()
}
