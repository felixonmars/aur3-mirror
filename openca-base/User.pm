## OpenCA::User
##
## Copyright (C) 1999-2010 Massimiliano Pala (madwolf@openca.org)
## All rights reserved.
##
## This library is free for commercial and non-commercial use as long as
## the following conditions are aheared to.  The following conditions
## apply to all code found in this distribution, be it the RC4, RSA,
## lhash, DES, etc., code; not just the SSL code.  The documentation
## included with this distribution is covered by the same copyright terms
## 
## If this package is used in a product, Massimiliano Pala should be given
## attribution as the author of the parts of the library used.
## This can be in the form of a textual message at program startup or
## in documentation (online or textual) provided with the package.
## 
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
## 1. Redistributions of source code must retain the copyright
##    notice, this list of conditions and the following disclaimer.
## 2. Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
## 3. All advertising materials mentioning features or use of this software
##    must display the following acknowledgement:
##    "This product includes OpenCA software written by Massimiliano Pala
##     (madwolf@openca.org) and the OpenCA Labs (www.openca.org)"
## 4. If you include any Windows specific code (or a derivative thereof) from 
##    some directory (application code) you must include an acknowledgement:
##    "This product includes OpenCA software (www.openca.org)"
## 
## THIS SOFTWARE IS PROVIDED BY OPENCA DEVELOPERS ``AS IS'' AND
## ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
## ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
## FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
## DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
## OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
## HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
## LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
## OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
## SUCH DAMAGE.
## 
## The licence and distribution terms for any publically available version or
## derivative of this code cannot be changed.  i.e. this code cannot simply be
## copied and put under another distribution licence
## [including the GNU Public Licence.]
##

use strict;
use Encode;

use OpenCA::DBI;
use OpenCA::Tools;

package OpenCA::User;

## $Revision: 1.5 $
($OpenCA::User::VERSION = '$Revision: 1.5 $' )=~ s/(?:^.*: (\d+))|(?:\s+\$$)/defined $1?"0\.0":""/eg; 

our ($errno, $errval);


use constant SUCCESS		    	=> [ 1, "Success" ];
use constant ERR_GENERAL_ERROR      => [ 0, "Unknown Error" ];
use constant ERR_MISSING_PARAM	    => [ 10, "Missing Required Parameter" ];
use constant ERR_DB_NOT_INITIALIZED => [ 1000, "Database not Initialized" ];
use constant ERR_DB_CONNECTION      => [ 1010, "Cannot connect to database" ];
use constant ERR_DB_QUERY_ERROR	    => [ 1100, "DB Query Error" ];
use constant ERR_DB_ADD_USER	    => [ 1101, "DB Error with New User" ];
use constant ERR_USER_NOT_FOUND	    => [ 3001, "User Not Found" ];
use constant ERR_MISSING_USER_ID    => [ 3010, "No USER_ID used" ];
use constant ERR_TIME_COMPARISON    => [ 4001, "Date comparison error" ];

## User Status constants
use constant VALID_STATUS	    	=> "VALID";
use constant SUSPENDED_STATUS	    => "SUSPENDED";
use constant DELETED_STATUS	    	=> "DELETED";
use constant REVOKED_STATUS	    	=> "REVOKED";
use constant UNCONFIRMED_STATUS	    => "UNCONFIRMED";
use constant UNKNOWN_STATUS	    	=> "UNKNOWN";


$OpenCA::User::User = {
	KEY				=> "rowid",
	USER_ID			=> "user_id",
	STATUS			=> "status",
	DATA_SOURCE		=> "data_source",
	SECRET			=> "secret",
	LAST_ACTIVITY	=> "last_activity",
	NOTBEFORE		=> "notbefore",
	NOTAFTER		=> "notafter",
	SUSPENDED_AFTER => "suspended_after",
	REVOKED_AFTER   => "revoked_after",
	REASON 			=> "invalidity_reason",
};

$OpenCA::User::Data = {
	KEY			=> "row_id",
	USER_ID		=> "user_id",
	NAME		=> "data_name",
	VALUE		=> "data_value",
	SOURCE		=> "data_source",
};

$OpenCA::User::SQL = {
	USER_TABLE => $OpenCA::DBI::SQL->{TABLE}->{USER},
	USER_DATA  => $OpenCA::DBI::SQL->{TABLE}->{USER_DATA},
};

sub new {
	my $that = shift;
	my $class = ref($that) || $that;

	my $self = {};
	bless $self, $class;

	my $keys = { @_ };

	$self->{gettext} = ( $keys->{GETTEXT} or \&gettext );
	$self->{DEBUG}   = ( $keys->{DEBUG} or 0 );
	$self->{db}	 = $keys->{DB};
	$self->{debug_msg} = ();

	## Here we use the same initialization parameters we use
	## in OpenCA::DBI

	$self->{DB_Type}   = $keys->{DB_Type};
	$self->{DB_Host}   = $keys->{DB_Host};
	$self->{DB_Port}   = $keys->{DB_Port};
	$self->{DB_Name}   = $keys->{DB_Name};
	$self->{DB_User}   = $keys->{DB_User};
	$self->{DB_Passwd} = $keys->{DB_Passwd};
	$self->{DB_Namespace} = $keys->{DB_Namespace};

	$self->{SHELL}	   = ( $keys->{SHELL} or OpenCA::OpenSSL->new());
	$self->{GETTEXT}   = ( $keys->{GETTEXT} or \&gettext );

	if ( not defined $self->{SHELL} ) {
		$self->{SHELL} = 1;
		$self->debug ( "Initializing SHELL" );
	};

	if ( not defined $self->{db} ) {
		## We need to create a new DB object
		$self->{db} = OpenCA::DBI->new (
			DB_Type => $self->{DB_Type},
			DB_Host => $self->{DB_Host},
			DB_Name => $self->{DB_Name},
			DB_Port => $self->{DB_Port},
			DB_User => $self->{DB_User},
			DB_Passwd => $self->{DB_Passwd},
			DB_Namespace => $self->{DB_Namespace},
			DEBUG => $self->{DEBUG},
			DEBUG_STDERR => $self->{DEBUG},
			SHELL => $self->{SHELL},
			GETTEXT => $self->{GETTEXT} );

		if( not $self->{db} ) {
			$self->set_error( ERR_DB_NOT_INITIALIZED );
			exit($self->errno);
		}

	}

	if( not $self->{db}->connect() ) {
		$self->set_error ( ERR_DB_CONNECTION );
		return undef;
	}

	return $self;
}

## Get a Specific User (user_id)
## =============================

sub get {
	my $self = shift;
	my @ret_list = ();

	my $keys = { @_ };

	if( $keys->{USER_ID} eq "" ) {
		$self->set_error ( ERR_MISSING_USER_ID );
		return undef;
	}

	@ret_list = $self->search ( USER_ID => $keys->{USER_ID} );

	return ( $ret_list[0] );
}

## Search for a User
## =================

sub search {
	my $self = shift;
	my @ret = ();

	my $keys = { @_ };

	my $query = "";

	if ( $keys->{QUERY} ne "" ) {
		$query = $keys->{QUERY};

		$self->debug( "Query: $query" );
		if( not defined $self->{db}->doQuery ( QUERY=> $query, 
				BIND_VALUES => $keys->{BIND_VALUES} ) ) {
			$self->set_error( ERR_DB_QUERY_ERROR,
					 $self->{db}->errval);
			return undef;
		}
	} else {
		## Here we build the query based on the values from the passed
		## keys

		my @bind_values = ();
		my @cols = ();
		my $op = ( $keys->{OPERATOR} or " = " );

		foreach my $col ( keys %$OpenCA::User::User ) {
			push ( @cols,  $OpenCA::User::User->{$col} );
		};

		my $query = qq{ SELECT } .  join ( ", ", @cols ) . " " .
			    qq{ FROM } . $OpenCA::User::SQL->{USER_TABLE} . 
			    " WHERE ";

		## Check for the USER ID
		foreach my $i ("KEY", "USER_ID", "DATA_SOURCE", 
					"REASON", "STATUS", "SECRET") {
			if ( ref $keys->{$i} eq "ARRAY" ) {
				$op = " IN ";
				$query .= " " . $OpenCA::User::User->{$i} . 
					" $op ( '" .  
					join (@{$keys->{$i}}, "', '") . "' )". 
					" AND ";
			} elsif ( $keys->{$i} =~ /\%/ ) {
				$op = " LIKE ";
				$query .= " " . $OpenCA::User::User->{$i} . 
					" $op ? AND "; 
				push( @bind_values, $keys->{$i} );
			} elsif ( $keys->{$i} ne "" ) {
				$op = " = ";
				$query .= " " . $OpenCA::User::User->{$i} . 
					" $op ? AND ";
				push( @bind_values, $keys->{$i} );
			}
		}

		my $op = ( $keys->{OPERATOR} or " >= " );
		foreach my $i ( "NOTAFTER", "NOTBEFORE", "SUSPENDED_AFTER", 
					"REVOKED_AFTER", "LAST_ACTIVITY" ) {

			if ( $keys->{$i} ne "" ) {
				if ( $op != /^(>|>=|<|<=|=)$/ ) {
					$self->set_error(ERR_TIME_COMPARISON);
					return undef;
				};

				$query .= " " . $OpenCA::User::User->{$i} . " $op ? AND ";
				push( @bind_values, $keys->{$i} );
			}
		};

		$query =~ s/AND $//;
		$query =~ s/WHERE $//;

		if( not defined $self->{db}->doQuery ( QUERY => $query, 
					BIND_VALUES => \@bind_values) ) {
			$self->set_error ( ERR_DB_QUERY_ERROR, 
				$self->{db}->errval);
			$self->debug ("ERR QUERY: $query");
			$self->debug ("ERR QUERY VALUES: @bind_values");

			return undef;
		}
	}

	## Here we assume we have our return values
	my @retList = ();
	while ( (my $h =  $self->{db}->{STH}->fetchrow_hashref) ) {

		my $item = undef;
		foreach my $userCol ( keys %$OpenCA::User::User ) {
			$item->{$userCol} = 
				$h->{$OpenCA::User::User->{$userCol}};
		}

		push ( @ret, $item );
        }
	
	return \@ret;
}


## Add User
## ========

sub add {
	my $self = shift;
	my $keys = { @_ };
	my $user = undef;
	my $status = undef;
	my @cols = ();
	my @values = ();

	my $query = "";

	if ( defined $keys->{USER} ) {
		$user = $keys->{USER};
	} else {
		$user = $keys;
	}

	if (( $status = $self->getStatus( USER=> $user )) eq UNKNOWN_STATUS) {
		$user->{STATUS} = UNCONFIRMED_STATUS;
	}

	foreach my $val ( keys %$user ) {
		if ( $user->{$val} ne "" ) {
			push ( @cols, $OpenCA::User::User->{uc($val)} );
			push ( @values, $user->{$val} );
		}
	}

	$query = "INSERT INTO " .  $OpenCA::User::SQL->{USER_TABLE} . 
			" ( " . join ( ", ", @cols) . ") VALUES ( '" .
			join ( "', '", @values ) . "' )";

	if ( not defined $self->{db}->doQuery ( QUERY => $query, 
						BIND_VALUES => undef )) {
		$self->debug ( "QUERY ERR:: $query");
		$self->debug ( "QUERY ERR:: @values");
		$self->set_error ( ERR_DB_ADD_USER, $self->{db}->errval );
		return undef;
	}

	return 1;
}

## Get Status
## ==========
##
## Gets the user status from the DB

sub getStatus {
	my $self = shift;

	my $keys = { @_ };

	my $userID = ( $keys->{USER_ID} or $keys->{USER}->{USER_ID} );
	my $user = $self->get ( USER_ID => $userID );

	if ( $user eq "") {
		return ERR_USER_NOT_FOUND;
	}

	     if ( $user->{STATUS} =~ /VALID/i ) {
		return VALID_STATUS;
	} elsif ( $user->{STATUS} =~ /SUSPENDED/i ) {
		return SUSPENDED_STATUS;
	} elsif ( $user->{STATUS} =~ /DELETED/i ) {
		return DELETED_STATUS;
	} elsif ( $user->{STATUS} =~ /REVOKED/i ) {
		return REVOKED_STATUS;
	} elsif ( $user->{STATUS} =~ /UNCONFIRMED/i ) {
		return UNCONFIRMED_STATUS;
	} else {
		$self->set_error( UNKNOWN_STATUS, $user->{STATUS} );
		return UNKNOWN_STATUS;
	}
}

## is Valid
## ========

sub isValid {
	my $self = shift;
	my $keys = { @_ };
	my $user = undef;

	my $ret = $self->getStatus( @_ );

	if( $ret =~ /VALID/ ) {
		return 1;
	} else {
		return 0;
	}
}

#############################################################################
##                            ERROR HANDLING FUNCS                         ##
#############################################################################

sub set_error {
	my $self = shift;
	my $errno = $_[0];
	my $message = undef;
	my @ca0 = ( caller (0));
	my @ca1 = ( caller (1));

	if ( $ca1[3] eq "" ){
		$ca1[3] = "main";
	}

	my @errConf = ( $_[0], $_[1] );

	if ( ref $_[0] eq "ARRAY" ) {
		@errConf = @{ $_[0] };
	}

	$self->{errno} = $errConf[0];
	$self->{errval} = $errConf[1];

	my $message = "[$ca0[1]::line $ca0[2]] $ca1[3]()->" .
				$self->{errno} . "::" . $self->{errval};
	print STDERR "$message\n";

	return undef;
}

sub errno {
    my $self = shift;

    return $self->{errno} if ($self->{errno});
    return $errno;
}

sub errval {
    my $self = shift;

    return $self->{errval} if ($self->{errval});
    return $errval;
}


sub debug {
	my $self = shift;

	my $message = $_[0];
	my @ca0 = ( caller (0));
	my @ca1 = ( caller (1));

	if ( $ca1[3] eq "" ){
		$ca1[3] = "main";
	}

	if ( $message eq "" ) {
		$message = "[$ca0[1]::line $ca0[2]] $ca1[3]()->$errval " .
				"($errno)";
	} else {
		$message = "[$ca0[1]::line $ca0[2]] $ca1[3]()->$message";
	}

	$message =~ s/main:://g;
	$message =~ s/\.\///g;

	if ( $_[0] ) {
		push ( @{$self->{debug_msg}}, $message );
		$self->debug() if ( $self->{DEBUG} eq 1 );
	} else {
		foreach my $msg ( @{$self->{debug_msg}} ) {
			print STDERR "$msg\n";
		}
		$self->{debug_msg} = ();
    	}
	
	return undef;
}

sub gettext {
	my $self = shift;

	return $_[0];
}

#############################################################################
##                         check the channel                               ##
#############################################################################
# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
