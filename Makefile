SHELL := /bin/zsh

# --- DARKMODE FLAG ---

H := $(shell date +%H)
FROM := 21
TO := 8
DARKMODEFLAG := $(shell python -c "print(f'{int('$H') >= $(FROM) or int('$H') < $(TO)}'.lower())")

# or use:
# gdbus call --session --dest org.freedesktop.portal.Desktop \
#  --object-path /org/freedesktop/portal/desktop \
#  --method org.freedesktop.portal.Settings.Read \
#  org.freedesktop.appearance color-scheme

# --- END DARKMODE FLAG ---

# --make-deps --ignore-system-fonts

watch:
	# note: date will not update when recompiled
	typst watch \
	  --font-path ~/git-repos/Fira/ttf \
	  --input date="`date`" \
	  --input darkmode=$(DARKMODEFLAG) \
	  --input gitversion="`git describe --tags --first-parent --abbrev=6 --long --always --dirty`" \
	  thesis.typ

comp:
	typst compile \
	  --font-path ~/git-repos/Fira/ttf \
	  --input date="`date`" \
	  --input darkmode=$(DARKMODEFLAG) \
	  --input gitversion="`git describe --tags --first-parent --abbrev=6 --long --always --dirty`" \
	  thesis.typ

o:
	open thesis.pdf

c: clean

clean:
	rm *.pdf


# ps2pdf -dPDFSETTINGS=/ebook "./thesis.pdf" "./thesis-compressed.pdf"

# publish:
#	rsync -avPz --mkpath -e 'ssh' ./*.pdf domain:/path/to/thesis/

# spell:
#	# cat thesis.org | aspell --lang=en list | uniq | wc -l
#	aspell --lang=en -c thesis.org
