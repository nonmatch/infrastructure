.PHONY: default build run antlr

default: build

build: antlr
	docker build -t henny022p/cexplore-tmc:parser .

run:
	docker container stop cexplore || true && docker container rm cexplore || true
	docker container run -d --name "cexplore" --restart=always -it -p 10240:10240 henny022p/cexplore-tmc:parser

antlr:
	cd frontends && java -jar antlr-4.9.2-complete.jar -o antlr ASM.g4 -no-listener -visitor -Dlanguage=Python3

clean:
	rm -r frontends/antlr

build_local:
	rm -f compiler-explorer/etc/config/*.properties
	cp local/c.local.properties local/assembly.local.properties compiler-explorer/etc/config/
	cd compiler-explorer && make prereqs webpack WEBPACK_ARGS="-p"

run_local:
# TODO remove
	cp local/* compiler-explorer/etc/config/

	cd compiler-explorer && ./node_modules/.bin/supervisor -w app.js,lib,etc/config -e 'js|node|properties|yaml' --exec /usr/bin/node  -- -r esm ./app.js

dev_local:
	export NODE_ENV=development
	cd compiler-explorer && ./node_modules/.bin/supervisor -w app.js,lib,etc/config -e 'js|node|properties|yaml' -n exit --exec /usr/bin/node  -- -r esm ./app.js
