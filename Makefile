default: generate

generate: public

public:
	blacksmith generate

preview:
	blacksmith preview

publish:
	./pull-updates.sh
	$(MAKE) public
	
.PHONY: public preview
