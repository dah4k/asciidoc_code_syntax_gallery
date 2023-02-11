SOURCE_ADOC = $(filter-out README.adoc,$(wildcard *.adoc))
DEFAULT_HTML= $(subst .adoc,.html,$(SOURCE_ADOC))
DEFAULT_PDF = $(subst .adoc,.pdf,$(SOURCE_ADOC))

all: html pdf

html: $(DEFAULT_HTML)

pdf: $(DEFAULT_PDF)

%.html: %.adoc
	asciidoctor --out-file $@ $<

%.pdf: %.adoc
	asciidoctor --require asciidoctor-pdf --backend pdf --out-file $@ $<

clean:
	-rm -f $(DEFAULT_PDF)
	-rm -f $(DEFAULT_HTML)

.PHONY: all html pdf clean
