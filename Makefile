.DEFAULT_GOAL := default

cache_directory = ~/.cache/ansible/roles/pi-boot-drive

# Workaround for OSX 10.13+ fork incompatibility with python fork
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

clean:
	@if [ -d $(cache_directory) ];then rm -r $(cache_directory);fi
	@if [ -f *.retry ]; then rm *.retry;fi
	@if [ -d ./facts ];then rm -r ./facts;fi

lint:
	@yamllint . --strict
	@ansible-lint *.yml
	@ansible-lint ./roles/*/

site:
	@ansible-playbook site.yml

default: clean lint
