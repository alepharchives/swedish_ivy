# Laundry List

## General

- Track cyclic dependencies
- Warn when cyclic dependencies exist
- Allow user to set up global and/or local policy for cyclic dependency handling
    - warn and continue when prior inclusion matches the version spec for an incoming (unprocessed) dependency
    - resolve to highest version
    - resolve to lowest version
    - first come, first served (i.e., resolve to the first version installed and ignore future inclusions)
- Support overriding config in deps

## SCM Handling

- Currently it's possible to checkout a repository at version ".*" :-)

## Local Repository Structure

This is author/publisher oriented, so we would have a directory structure 
something like this:

    - .rebar (situated in $HOME)
        - alt_deps_repository
            - org
                - nebularis
                    - eav-0.0.1
                - basho
                    - rebar-1.0
                    - riak_kv-1.0.0
                    - luwak-0.0.1
                    - lager-1.0.2
                    - riak_core-2.0.1
                    - riak-1.5.2
                    - webmachine-2.0.1
                - mochi
                    - mochiweb-1.5.2
                    - mochiweb-1.5.1
            - ahmednawras
                - log4erl-0.9.0
            - jeraymond
                - log4erl-0.9.0
            - hyperthunk
                - rebar-1.2.1
                - mochiweb-1.5.2
                - xoa_core-0.0.1
                - xoa_http-0.0.2
