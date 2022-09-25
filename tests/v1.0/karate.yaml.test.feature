
Feature: Basic

# The secrects can be used in the payload with the following syntax #(mysecretname)
Background:
* def sqlconnection = karate.properties['sqlconnection']


# Scenario: sql

# 	Given url karate.properties['testURL']

# 	And path '/'
# 	And header Direktiv-ActionID = 'development'
# 	And header Direktiv-TempDir = '/tmp'
# 	And request
# 	"""
# 	{
# 		"connection": "pg://direktiv:Nyjn_%28_6%7B2P%7DD8z18xH%3F%3AM1M@10.100.6.7:5432/direktiv",
# 		"queries": [
# 			{
# 				"query": "select * from namespaces"
# 			}
# 		]

# 	}
# 	"""
# 	When method POST
# 	Then status 200

	
Scenario: sql

	Given url karate.properties['testURL']

	And path '/'
	And header Direktiv-ActionID = 'development'
	And header Direktiv-TempDir = '/tmp'
	And request
	"""
	{
		"connection": "pg://direktiv:Nyjn_%28_6%7B2P%7DD8z18xH%3F%3AM1M@10.100.6.7:5432/direktiv",
		"queries": [
			{
				"query": "select * from namespaces where oid = :'ARG'",
				"args": [
					"ARG=9f81ab5b-aa13-4393-bbd6-adce3d2da958"
				]
			}
		]

	}
	"""
	When method POST
	Then status 200
