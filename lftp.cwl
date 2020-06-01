cwlVersion: v1.0
class: CommandLineTool

doc: "transfer file passed from the previous task to the remote ftp server"
requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: lvarin/crypt4gh-lftp
  - class: MultipleInputFeatureRequirement
  - class: InitialWorkDirRequirement
    listing: ${
        var r = [];
        for (var i=0; i < inputs.files_to_send.length; i++) {
          r.push(inputs.files_to_send[i]);
        }
        return r;
      }
  - class: ResourceRequirement
    outdirMin: 7200
hints:
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 2000

inputs:
  - id: files_to_send
    type:
      type: array
      items: File
#      inputBinding:
#        valueFrom: $(self.basename)
outputs:
  - id: output
    type: stdout

baseCommand: ["lftp"]
arguments:
  - position: 0
    prefix: "-f"
    valueFrom: "/secret/lftp.txt"

