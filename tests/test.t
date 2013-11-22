use Test::More;

BEGIN {
	use_ok( Bio::KBase::Workflow::KBW );
}

can_ok ( "Bio::KBase::Workflow::KBW", qw(
	  list_workflows
	  install_path )
  
       );


ok (defined {$p = Bio::KBase::Workflow::KBW::install_path()}, "install path is $p");
ok (defined {$l = Bio::KBase::Workflow::KBW::list_workflows()}, "installed workflows $l");
done_testing();
