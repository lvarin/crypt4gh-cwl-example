class: Workflow
cwlVersion: v1.0
id: encrypt_sftp

inputs:
  - id: input
    type: File
    doc: "to be encrypted"

outputs: []

steps:
  - id: encrypt
    run: encrypt.cwl
    in:
      - id: file_to_encrypt
        source: input
    out: []

