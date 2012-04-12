default: generate

generate: public

public:
	blacksmith generate

preview:
	blacksmith preview

publish:
	./pull-updates.sh
	$(MAKE) public
	git add public/*
	git commit -m "Autogenerated documentation from publish target $$(date)"

push: publish
	git push origin

.PHONY: public preview
