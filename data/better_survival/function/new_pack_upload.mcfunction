$tellraw @a {"text": "","extra":[ \
	{ \
		"text": "$(actor)", \
		"color": "blue", \
		"underlined": true, \
		"clickEvent": {"action": "open_url", "value": "https://github.com/$(actor)"} \
	}, \
	{"text": " just uploaded a new resource pack!\n"}, \
	{ \
		"text": "$(msg)", \
		"color": "aqua", \
		"clickEvent": {"action": "open_url", "value": "https://github.com/$(full_ref)"} \
	} \
]}
