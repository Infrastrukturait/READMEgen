READMEGEN_VERSION ?= main
READMEGEN_CONFIG ?=
READMEGEN_OUTPUT ?= README.md
READMEGEN_TEMPLATE ?= README.md.template

.PHONY: readme
readme:
	./bin/readmegen \
		$(if $(READMEGEN_CONFIG),--config $(READMEGEN_CONFIG),) \
		--output $(READMEGEN_OUTPUT) \
		--template $(READMEGEN_TEMPLATE)

.PHONY: check-readme
check-readme:
	./bin/readmegen \
		$(if $(READMEGEN_CONFIG),--config $(READMEGEN_CONFIG),) \
		--output $(READMEGEN_OUTPUT) \
		--template $(READMEGEN_TEMPLATE) \
		--check

.PHONY: install
install:
	install -m 0755 ./bin/readmegen /usr/local/bin/readmegen

.PHONY: uninstall
uninstall:
	rm -f /usr/local/bin/readmegen

.PHONY: smoke
smoke:
	./bin/readmegen \
		$(if $(READMEGEN_CONFIG),--config $(READMEGEN_CONFIG),) \
		--output /tmp/readmegen.README.md \
		--template $(READMEGEN_TEMPLATE)
