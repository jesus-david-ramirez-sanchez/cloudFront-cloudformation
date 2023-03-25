#!/bin/bash
aws cloudformation package --template-file font-admin.yaml --s3-bucket mipaquete-cfn-templates --output-template-file packaged.yaml
aws cloudformation deploy --template-file packaged.yaml --stack-name admin-prod --tags project=admin --capabilities CAPABILITY_NAMED_IAM --parameter-overrides \
    ProjectName=name \
    Domain=domain \
    DomainApp=domainApp \
    EnvType=prod \
    SSLCertificate=arnCertificateSSL
aws cloudformation update-termination-protection --stack-name admin-prod --enable-termination-protection