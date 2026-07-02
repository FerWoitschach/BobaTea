default: build upload

clean:
	rm -rf module/build/*
	rm -rf module/releases/*

trans:
	coconut module/source module/build --target 3.14

build: clean trans
	python -m build --outdir module/releases/

unzip:
	unzip -l module/releases/*.whl

check: unzip
	python -m twine check module/releases/*

upload: check
	python -m twine upload --verbose module/releases/*

edit:
	code . --profile="bobatea"
