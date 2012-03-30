default: generate

generate: public

public:
	blacksmith generate

preview:
	blacksmith preview

.PHONY: public preview
