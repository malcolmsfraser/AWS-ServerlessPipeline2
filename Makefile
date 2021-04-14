install:
	pip install --upgrade pip &&\
		pip install -r producer2.0/hello_world/requirements.txt &&\
			pip install -r labeler/hello_world/requirements.txt &&\
				pip install --upgrade aws-sam-cli

lint: 
	cd producer2.0/hello_world/; \
		pylint --disable=R,C,W1203,W0311 *.py;
	cd labeler/hello_world/; \
		pylint --disable=R,C,W1203,W0311 *.py;
		
deploy_producer:
	cd producer2.0/hello_world/; \
		pylint --disable=R,C,W1203,W0311 *.py;
	cd producer2.0; \
		sam build --use-container; \
		sam deploy --config-file samconfig.toml --no-confirm-changeset
		
deploy_labeler:
	cd labeler/hello_world/; \
		pylint --disable=R,C,W1203,W0311 *.py;
	cd labeler/; \
		sam build --use-container; \
		sam deploy --config-file samconfig.toml --no-confirm-changeset