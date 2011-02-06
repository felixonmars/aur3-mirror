#!perl
use List::Util qw(min max);

sub on_user_command {
	my($self, $cmd) = @_;

	if($cmd =~ /^pagescroll:\w+$/ ) {
		my $page_height = $self->nrow - 1;
		my $current_line = $self->view_start;
		my $new_line = $current_line;
		if ($cmd eq "pagescroll:up") {
			$new_line = max($current_line - $page_height, $self->top_row);
		} elsif ($cmd eq "pagescroll:down") {
			$new_line = min($current_line + $page_height, 0);
		}
		$self->view_start($new_line);
		$self->want_refresh;
	}

	()
}
