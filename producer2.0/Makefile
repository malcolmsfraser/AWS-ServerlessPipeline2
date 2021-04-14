install:
	pip install --upgrade pip&&\
		pip install -r ProducerFunction/requirements.txt
			pip install aws-sam-cli --upgrade

test:

	
lint:
	pylint --disable=R,C ~/environment/producer2.0/.aws-sam/build/ProducerFunction/app.py
	
deploy:
	sam deploy