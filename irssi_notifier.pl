#!/usr/bin/perl
use strict;
use Irssi;
use Irssi::Irc;
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
	my $not_file = $ENV{ HOME } . "/.irssi_notifier/msg";
	my $server = $dest->{server};

	# Do not run the command if we're not supposed to when away
	return if ($server->{usermode_away});

	# Run the command if we're hilighted
	if ($dest->{level} & MSGLEVEL_MSGS || (($dest->{level} & MSGLEVEL_HILIGHT) && ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0)) {
		open(F, ">", $not_file) || die('Cant open ~/.irssi_notifier/msg file');
		print F $stripped;
		close(F);
	}
}

Irssi::signal_add('print text', 'sig_printtext');
