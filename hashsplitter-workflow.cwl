#!/usr/bin/env cwlrunner

class: Workflow

cwlVersion: v1.0

inputs:
  - id: input
    type: File
    doc: "to be encrypted"
  - id: input2
    type: File
    doc: "to be encrypted as well"

outputs:
  - id: output
    type:
      type: array
      items: Directory
    outputSource: encryptL/output

steps:
  - id: encryptL
    run: encrypt.yml
    in:
      - id: files_to_send
        source:
          - input
          - input2
    out:
      - id: output

# Source "output" of type {"type": "array", "items": "File"} is incompatible with sink "output" of  type "File"


requirements:
  - class: MultipleInputFeatureRequirement
