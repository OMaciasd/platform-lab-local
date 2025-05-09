import pact
from pact import Consumer, Provider

consumer = Consumer('ConsumerService').has_pact_with(Provider('ProviderService'))
consumer.start_service()

# Define interactions
consumer \
  .given('Provider exists') \
  .upon_receiving('A request for some data') \
  .with_request('GET', '/data') \
  .will_respond_with({
    'status': 200,
    'body': {'data': 'value'}
  })

# Run the consumer test
consumer.verify()
