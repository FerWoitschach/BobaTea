build:
	rm -rf module/releases/
	python -m build --outdir module/releases/

check:
	unzip -l module/releases/*.whl
	python -m twine check module/releases/*

upload:
	python -m twine upload --verbose module/releases/*

edit:
	code . --profile="bobatea"
