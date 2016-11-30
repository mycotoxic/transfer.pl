#!/usr/bin/perl
# not using strict and warnings is for plebs.
use strict;
use warnings;
use LWP::UserAgent;

sub upload {
  my ($file_to_upload) = @_; # only need 1 arg
  print "Uploading ".$file_to_upload."...\n";
  print "This might take a while...\n";
  my $ua = LWP::UserAgent->new;
  my $endpoint = "https://transfer.sh/".$file_to_upload;
  my $req = HTTP::Request->new(PUT => $endpoint);
  local $/ = undef;
  open(CONTENT, $file_to_upload) or die "$!";
  $req->content(<CONTENT>);
  my $resp = $ua->request($req);
  if ($resp->is_success) {
    my $message = $resp->decoded_content;
    print "Download URL: $message";
  }
  else {
    print "Something fucked up...\n";
  }
}

if ($#ARGV + 1 != 1){
  print "use: ./transfer.pl yer_file.ext\n";
  exit;
}
upload($ARGV[0]);
