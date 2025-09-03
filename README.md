# tfmodule-azure-context

tfmodule-auzre-context 테라폼 모듈은 Azure 클라우드 서비스 및 리소스를 정의 하는데 표준화된 네이밍 정책과 태깅 규칙을 지원 하고, 일관성있는 데이터소스 참조 모델을 제공 합니다.

## Usage

```hcl
module "ctx" {
  source = "git::https://github.com/oniops/tfmodule-azure-context.git?ref=v1.0.0"

  context = {
    project     = "demo"
    environment = "Development"
    owner       = "azure_demo@example.com"
    domain      = "example.com"
    customer    = "Example Customer"
    team        = "Example Team"
    region      = "Korea Central"
    tenant_id   = "11112222-3333-4444-5555-666677778888"
    department  = "Example"
  }
}


# Using context variables from ctx module
locals {
  context     = module.ctx.context
  tags        = module.ctx.tags
  region      = module.ctx.region
  project     = module.ctx.project
  environment = module.ctx.environment
  domain      = module.ctx.domain
  name_prefix = module.ctx.name_prefix
}
```

## Variables

### Input

<table>
<thead>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th> 
        <th>Default</th>
        <th>Required</th>
        <th>Example</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>context</td>
        <td>표준화된 네이밍 정책, 태그 지정 규칙, 일관된 데이터 소스 참조 모듈을 제공하기 위한 Context 정보 입니다.</td>
        <td>map(string)</td>
        <td></td>
        <td>yes</td>
        <td>
<pre>
{
  project     = "demo"
  environment = "Development"
  owner       = "azure_demo@example.com"
  domain      = "example.com"
  customer    = "Example Customer"
  team        = "Example Team"
  region      = "Korea Central"
  tenant_id   = "11112222-3333-4444-5555-666677778888"
  department  = "Example"
}
</pre>
        </td>
    </tr>
    <tr>
        <td>team</td>
        <td>팀 이름 입니다.</td>
        <td>string</td>
        <td>null</td>
        <td>no</td>
        <td>"Example Team"</td>
    </tr>
    <tr>
        <td>owner</td>
        <td>프로젝트 또는 프로덕트의 Owner 입니다.</td>
        <td>string</td>
        <td>null</td>
        <td>no</td>
        <td>"Example Owner"</td>
    </tr>   
    <tr>
        <td>additional_tags</td>
        <td>이 모듈에서 생성되는 리소스에 대해 추가 태그를 지정하세요. 모든 리소스에 적용되는 기본 태그는 Context 값에 따라 결정됩니다.</td>
        <td>map(string)</td>
        <td>{}</td>
        <td>no</td>
        <td>{Timestamp = "20101231", CompanyURL = "https://my-company-url.com"}</td>
    </tr> 
    <tr>
        <td>provisioner</td>
        <td>프로비저닝 시 사용되는 도구 이름 입니다.</td>
        <td>string</td>
        <td>Terraform</td>
        <td>no</td>
        <td>MyIaCTool</td>
    </tr>   
</tbody>
</table>

### Output

<table>
<thead>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th> 
        <th>Example</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>context</td>
        <td>입력받은 context 입니다.</td>
        <td>object</td>
        <td>Input vairable context 와 동일 합니다.</td>
    </tr>
    <tr>
        <td>context_string</td>
        <td>Key=Value 형식으로 Comma-Seperated 된 Context 값 입니다.</td>
        <td>string</td>
        <td>"project=example_project,region=example_region,environment=example_env"....</td>
    </tr>
    <tr>
        <td>project</td>
        <td>입력받은 context의 project 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 project 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>environment</td>
        <td>입력받은 context의 environment 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 environment 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>owner</td>
        <td>입력받은 context의 owner 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 owner 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>domain</td>
        <td>입력받은 context의 domain 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 domain 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>region</td>
        <td>입력받은 context의 region 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 region 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>region</td>
        <td>입력받은 context의 tenant_id 값 입니다.</td>
        <td>string</td>
        <td>Input vairable context 의 tenant_id 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>team</td>
        <td>team 값 입니다.</td>
        <td>string</td>
        <td>Input vairable team 값과 동일 합니다.</td>
    </tr>
    <tr>
        <td>env_alias</td>
        <td>입력받은 context의 environment 값의 맨 첫번째 문자 입니다.</td>
        <td>string</td>
        <td>development 인 경우 d, production 인 경우 p 입니다.</td>
    </tr>
    <tr>
        <td>env_alias</td>
        <td>입력받은 context의 environment 값의 맨 첫번째 문자 입니다.</td>
        <td>string</td>
        <td>development 인 경우 d, production 인 경우 p 입니다.</td>
    </tr>
    <tr>
        <td>subscription_id</td>
        <td>현재 azure cli를 통해 선택 된 구독 id 입니다.</td>
        <td>string</td>
        <td>"11112222-3333-4444-5555-666677778888"</td>
    </tr>
    <tr>
        <td>client_object_id</td>
        <td>현재 azure cli를 통해 로그인 된 사용자 계정 object id 입니다.</td>
        <td>string</td>
        <td>"11112222-3333-4444-5555-666677778888"</td>
    </tr>
</tbody>
</table>

