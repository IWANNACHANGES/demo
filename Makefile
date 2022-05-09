include env.mk

HELMFILE=helmfile

.PHONY: all clean list

info-%:
	$(eval SYSTEM = $(shell echo $* | cut -d - -f 1))
	$(eval APP = $(shell echo $* | cut -d - -f 2))

package-%: info-%
	$(MAKE) -C nodejs docker-$*

publish-%: info-%
	$(MAKE) -C nodejs publish-$*

init-env: .init-env
	${NPM_CLIENT} config set registry https://registry.npm.taobao.org/
	${NPM_CLIENT} config set @sensetime:registry "https://npm-registry.sensetime.com"
	 ${NPM_CLIENT} install 
	cd packages/master && ${NPM_CLIENT} install 
	cd packages/app1 && ${NPM_CLIENT} install 
	cd packages/app2 && ${NPM_CLIENT} install 
	cd packages/app3 && ${NPM_CLIENT} install 
	cd packages/app4 && ${NPM_CLIENT} install 

.init-env:
	touch .init-env

clean:
	$(MAKE) -C helm clean
	$(MAKE) -C nodejs clean
