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
- [patterns.dev](https://www.patterns.dev/)
- [docker-cheatsheet](https://dockerlabs.collabnix.com/docker/cheatsheet/)
- [erd-dbdiagram](https://dbdiagram.io/d)
- [eraser-io](https://eraser.io)
- [PlantUML](https://plantuml.com/zh/starting)
- [Hash Online](http://www.unit-conversion.info/texttools/base64/)

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
`Transform a variable to title-case`
- https://stackoverflow.com/questions/52874954/when-creating-a-vscode-snippet-how-can-i-transform-a-variable-to-title-case-li

```json
{
	"Typescript React Layout Component": {
	    "prefix": "lc",
	    "body": [
	      "import { FC, ReactNode } from 'react'",
	      "",
	      "interface ${TM_FILENAME_BASE/([a-z]*)-*([a-z]*)/${1:/capitalize}${2:/capitalize}/g}Props {",
	      "  children: ReactNode",
	      "}",
	      "",
	      "const ${TM_FILENAME_BASE/([a-z]*)-*([a-z]*)/${1:/capitalize}${2:/capitalize}/g}: FC<${TM_FILENAME_BASE/([a-z]*)-*([a-z]*)/${1:/capitalize}${2:/capitalize}/g}Props> = ({ children }) => {",
	      "  return <div>{children}</div>",
	      "}",
	      "",
	      "export default $TM_FILENAME_BASE"
	    ],
	    "description": "Typescript React Function Component"
	  },
}
```

# 4. OAuth Social Set-up
Google - `Authorized redirect URIs`
- https://console.cloud.google.com/apis/dashboard?pli=1
- http://localhost:3000/api/auth/callback/google

# 5. Local K8s and Docker Hub command
```
DOCKER_USER=yky32
```
```
SVC_NAME=user-auth-ext
```
```
# Verify
echo $DOCKER_USER $SVC_NAME
```
```
docker build -t $SVC_NAME .
```
```
docker tag $SVC_NAME $DOCKER_USER/$SVC_NAME:latest
```
```
docker push $DOCKER_USER/$SVC_NAME 
```
```
kubectl apply -f ./$SVC_NAME.yaml
```

# 6. Git Model
- https://blog.jetbrains.com/space/2023/04/18/space-git-flow/

# 7. k8s
svc-url
```
<service-name>.<namespace>.svc.cluster.local:<service-port>
http://example-service.default.svc.cluster.local:9000
http://uaa-svc/oauth2/token
# http://{kind:service.metadata.name}:port/suffix  ___ default-80-no-need-add
```
