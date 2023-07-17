SRC = la-softdev-convention.adoc
PDF = la-softdev-convention.pdf

PDF_THEME = themes/la-softdev-pdf.yml

.PHONY: all clean

$(PDF): $(PDF:.pdf=.adoc) $(SRC) $(PDF_THEME)
	asciidoctor-pdf \
		-a compress \
		-a pdf-style="$(PDF_THEME)" \
		-a pdf-fontsdir=fonts \
		-v \
		--trace \
		$< -o $@

html: $(patsubst %.adoc, %.html, $(SRC))

%.html: %.adoc
	asciidoctor $^ -o $@

clean:
	-rm -rf $(patsubst %.adoc, %.html, $(SRC))
