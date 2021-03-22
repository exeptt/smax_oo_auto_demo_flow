namespace: flow
flow:
  name: Create_temp_file
  inputs:
    - file_path: /var/log/oo-designer/access
  workflow:
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time: []
        publish:
          - current_time: '${output}'
        navigate:
          - SUCCESS: write_to_file
          - FAILURE: on_failure
    - write_to_file:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: '${file_path}'
            - text: "${current_time + '\\n'}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - current_date_time_output: '${current_time}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      write_to_file:
        x: 835
        'y': 168
        navigate:
          e7fb3b1d-66c0-b3b0-9f62-560287f4187d:
            targetId: a408a74a-3ddf-4deb-cf57-ded03f09ab19
            port: SUCCESS
      get_time:
        x: 537
        'y': 174
    results:
      SUCCESS:
        a408a74a-3ddf-4deb-cf57-ded03f09ab19:
          x: 1127
          'y': 168
