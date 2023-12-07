*** Settings ***
Documentation       Checks for crashlooping pods
Metadata            Author    Jon
Metadata            Display Name    Kubernetes Deployment Triage
Metadata            Supports    Kubernetes,AKS,EKS,GKE,OpenShift

Library             BuiltIn
Library             RW.Core
Library             RW.platform
Library             OperatingSystem
Library             String
Library             Process

Suite Setup         Suite Initialization


*** Tasks ***
Check For CrashLooping Pods In `${NAMESPACE}`
    [Documentation]    Checks for crashlooping pods in the namespace.
    [Tags]    crashlooping    pods    namespace
    ${results}=    Run Process    ./inspect_pods.sh
    Log To Console    ${results.stdout}


*** Keywords ***
Suite Initialization
    ${kubeconfig}=    RW.Core.Import Secret
    ...    kubeconfig
    ...    type=string
    ...    description=The kubernetes kubeconfig yaml containing connection configuration used to connect to cluster(s).
    ...    pattern=\w*
    ...    example=For examples, start here https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/

    ${NAMESPACE}=    RW.Core.Import User Variable    NAMESPACE
    ...    type=string
    ...    description=The name of the Kubernetes namespace to scope actions and searching to.
    ...    pattern=\w*
    ...    example=my-namespace

    Set Suite Variable    ${kubeconfig}    ${kubeconfig}
    Set Suite Variable    ${NAMESPACE}    ${NAMESPACE}
    Set Suite Variable
    ...    ${env}
    ...    {"KUBECONFIG":"./${kubeconfig.key}", "NAMESPACE":"${NAMESPACE}"}
