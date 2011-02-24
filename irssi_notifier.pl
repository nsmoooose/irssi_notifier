#!/usr/bin/perl
use strict;
use Irssi;
use Irssi::Irc;
use Socket;
use vars qw($VERSION %IRSSI);

$VERSION = "1.0";
%IRSSI = (
	"authors"       => "HenrikN",
	"contact"       => "",
	"name"          => "irssi_notifier",
	"description"   => "",
	"url"           => "",
	"license"       => "whatever",
	"changed"       => "2010-06-07"
	);

sub sig_printtext {
	my ($dest, $text, $stripped) = @_;
	my $server = $dest->{server};
	my $addr = $ENV{ HOME } . "/.irssi_notifier/msg";

	# Do not run the command if we're not supposed to when away
	# return if ($server->{usermode_away});

	# Run the command if we're hilighted
	if ($dest->{level} & MSGLEVEL_MSGS || (($dest->{level} & MSGLEVEL_HILIGHT) && ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0)) {
		socket(SOCK, AF_UNIX, SOCK_STREAM, 0) || die('Failed to create socket.');
		connect(SOCK, sockaddr_un($addr)) || die('Failed to connect socket.' . $! . $addr);
		send(SOCK, $stripped, 0) || die('Failed to send.');
		close(SOCK);
	}
}

Irssi::signal_add('print text', 'sig_printtext');
