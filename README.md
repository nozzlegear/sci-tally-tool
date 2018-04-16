Required environment variables:

|Variable|Description|Example|
----------|--------------|-------|
`SCI_TALLY_API_DOMAIN`|Domain to use as API gateway|`example.com`|
`SCI_TALLY_ENV`|Environment|`production` or `development`|
`SCI_TALLY_SWU_KEY`|sendwithus.com API key|`your_api_key`|
`SCI_TALLY_SWU_TEMPLATE_ID`|sendwithus.com email template id|`tem_abc_123`|
`SCI_TALLY_SENDER`|JSON-serialized sender address|`{"name":"Joshua Harms", "address":"joshua@example.com","replyTo":"joshua@example.com"}`|
`SCI_TALLY_PRIMARY_RECIPIENT`|JSON-serialized recipient address|`{"name":"Joshua Harms", "address":"joshua@example.com"}`|
`SCI_TALLY_CC_LIST`|JSON-serialized list of CC recipients|`[{"name":"Joshua Harms", "address":"joshua@example.com"}]`|
