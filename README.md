# engineering-warehouse
A informative warehouse for engineer.

## 🔗 Dev Tool Links
- [excalidraw](https://excalidraw.com/)
- [JSON Formatter](https://jsonformatter.curiousconcept.com/)
- [readme.so](https://readme.so/editor)
- [Free Faker API](https://jsonplaceholder.typicode.com/)
- [CRON tab](https://crontab.guru/)
- [JSON Crack](https://jsoncrack.com/editor)
- [coolors](https://coolors.co/generate)
- [converter](https://converter.net/)


# 1. set-up terminal and customize
https://www.youtube.com/watch?v=KwYqtbSwnH8&t=90s&ab_channel=marsela

`https://ohmyz.sh/`

# 2. Git Commit Message
`https://dev.to/hornet_daemon/git-commit-patterns-5dm7`


# 3. VS Code
Custom snippets
`File -> Preferences -> Configure User Snippets -> typerscriptreact.json`
```json
{
	"Typescript React Function Component": {
		"prefix": "fc",
		"body": [
			"import { FC } from 'react'",
			"",
			"interface ${TM_FILENAME_BASE}Props {",
			"  $1",
			"}",
			"",
			"const $TM_FILENAME_BASE: FC<${TM_FILENAME_BASE}Props> = ({$2}) => {",
			"  return <div>$TM_FILENAME_BASE</div>",
			"}",
			"",
			"export default $TM_FILENAME_BASE"
		],
		"description": "Typescript React Function Component"
	},
}
```
