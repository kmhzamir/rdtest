process DRAGENA_IDAT2GTC {
    label 'process_low'
    executor 'awsbatch'


    container "docker.io/kmhzamir/dragena:v1.2"

    output:
    path "*.tab.gz", emit: tabgz  // Emitting the empty .tab.gz file
    path "versions.yml", emit: versions  // Emitting the versions file

    script:
    """
    # Create an empty .tab.gz file
    echo -n "" | gzip > empty_file.tab.gz

    # Create a versions.yml file
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        dragena: v1.2
    END_VERSIONS
    """
}
