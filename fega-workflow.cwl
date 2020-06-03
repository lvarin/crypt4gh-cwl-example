class: Workflow
cwlVersion: v1.0
id: encrypt_sftp

inputs:
  - id: input
    type: File
    doc: "to be encrypted"
  - id: input2
    type: File
    doc: "to be encrypted as well"

outputs: []

steps:
  - id: encrypt
    run: encrypt.cwl
    in:
      - id: files_to_encrypt
        source:
          - input
          - input2
    out: []

