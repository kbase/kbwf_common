kbwf_common
===========

A set of common tooling for awe based workflows



Deploying Workflow Files

There is basically one thing you need to do if you are using the standard deployment process. The workflow files need to reside in a specific module directory at the time the make deploy target is executed. This directory is lib/Bio/KBase/Workflow/MyModule. MyModule is the name of the module (git repository name) transformed to uppercase words and no underscores (the repository module named my_module becomes MyModule). If the workflow files are in this directory when the make deploy target is executed, then your workflow file will be deployed to the deployment directory. If you are using a non-standard make file, then you might need to do more work. Assume the deployment TARGET is set to /kb/deployment, and I am located in the top level of my module directory, then

lib/Bio/KBase/Workflow/MGRastPipeline/test.awf

is deployed to

/kb/deployment/lib/Bio/KBase/Workflow/MGRastPipeline/test.awf



Using kbwf_common as a Dependency to Your Workflow

If you want additional common support, then you can specify that the kbwf_common module is a dependency of your module by adding the kbwf_common module to the DEPENDENCIES file in the module top level directory. This allows some additional support to be deployed. At the present time, two items are deployed out of kbwf_common. The first is the KBW.pm module. It is deployed into the standard perl library path in the Bio::KBase::Workflow namespace. It has one useful function that is list_workflows(). The list_workflows() function returns a list of all the deployed workflow files. The second artifact deployed is the kbwf-list script. It is just a command line version of the list_workflows() function that prints the deployed workfiles to STDOUT.

Changes to your module makefile don't need to happen if the workflow files are already in the module's lib/Bio/KBase/Workflow/MyModule directory. For the module that I am working on, I created an awf and a template directory in the module top level dir. I then added the following to the default make target in my module makefile: 

        -mkdir -p lib/Bio/KBase/Workflow/MGRastPipeline

	-cp templates/*.template lib/Bio/KBase/Workflow/MGRastPipeline

        -cp awf/*.awf lib/Bio/KBase/Workflow/MGRastPipeline

 


That's it. The rest of the deployment is driven by the deploy-lib target that is provided as part of the Makefile.common.rules include. (remember this include statement at the bottom of the module makefile: include $(TOP_DIR)/tools/Makefile.common.rules)
