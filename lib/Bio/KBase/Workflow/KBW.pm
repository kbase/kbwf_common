package Bio::KBase::Workflow::KBW;


use strict;
use File::Spec;
use File::Find;

sub install_path
{
   return File::Spec->catpath((File::Spec->splitpath(__FILE__))[0,1], '');
}

sub list_workflows
{
   my @list = ();
   my $wfd = install_path();
   find (sub { push @list, $File::Find::dir . "/" . $_
                 unless (-d or /KBW\.pm/);
             }, $wfd);
   return @list;
}

1;
