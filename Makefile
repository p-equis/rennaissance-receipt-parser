build:
		coffee -o out/src --compile src/*.coffee && coffee -o out/test --compile test/*.coffee
test:
		mocha out/test
clean:
		rm -r out

.PHONY: test
