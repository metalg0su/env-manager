# ㅇㅇ
까먹을까봐 적음


## 시작 전 수정해야 할 변수들
- ssh config 설정하여 대상 노드에 접근 가능하게 만들기
- vars.yml에서 해당 노드 이름 쓰기

## 시작
`$ ansible-playbook playbook.yml -i inventory.yml -K`
- `-K`: sudo 필요할 때 사용할 passphrase
