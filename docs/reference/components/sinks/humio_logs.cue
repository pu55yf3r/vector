package metadata

components: sinks: humio_logs: {
  title: "#{component.title}"
  short_description: "Batches log events to [Humio][urls.humio] via the [HEC API][urls.humio_hec]."
  long_description: "[Humio][urls.humio] is a time-series logging and aggregation platform for unrestricted, comprehensive event analysis, On-Premises or in the Cloud. With 1TB/day of raw log ingest/node, in-memory stream processing, and live, shareable dashboards and alerts, you can instantly and in real-time explore, monitor, and visualize any system’s data."

  _features: {
    batch: {
      enabled: true
      common: false,
      max_bytes: 1049000,
      max_events: null,
      timeout_secs: 1
    }
    buffer: enabled: true
    checkpoint: enabled: false
    compression: {
      enabled: true
      default: "none"
      gzip: true
    }
    encoding: {
      enabled: true
      default: null
      ndjson: null
      text: null
    }
    healthcheck: enabled: true
    multiline: enabled: false
    request: {
      enabled: true
      common: false,
      in_flight_limit: 10,
      rate_limit_duration_secs: 1,
      rate_limit_num: 10,
      retry_initial_backoff_secs: 1,
      retry_max_duration_secs: 10,
      timeout_secs: 60
    }
    tls: enabled: false
  }

  classes: {
    commonly_used: false
    function: "transmit"
    service_providers: ["Humio"]
  }

  statuses: {
    delivery: "at_least_once"
    development: "beta"
  }

  support: {
      input_types: ["log"]

    platforms: {
      "aarch64-unknown-linux-gnu": true
      "aarch64-unknown-linux-musl": true
      "x86_64-apple-darwin": true
      "x86_64-pc-windows-msv": true
      "x86_64-unknown-linux-gnu": true
      "x86_64-unknown-linux-musl": true
    }

    requirements: []
    warnings: []
  }

  configuration: {
    compression: {
      common: true
      description: "The compression strategy used to compress the encoded event data before transmission."
      groups: []
      required: false
      warnings: []
        type: string: {
          default: "none"
          enum: {
            none: "No compression."
            gzip: "[Gzip][urls.gzip] standard DEFLATE compression."
          }
        }
    }
    event_type: {
      common: false
      description: "The type of events sent to this sink. Humio uses this as the name of the parser to use to ingest the data.\n\nIf unset, Humio will default it to none.\n"
      groups: []
      required: false
      warnings: []
        type: string: {
          default: null
          examples: ["json","none"]
        }
    }
    host_key: {
      common: true
      description: "The name of the log field to be used as the hostname sent to Humio. This overrides the [global `host_key` option][docs.reference.global-options#host_key]."
      groups: []
      required: false
      warnings: []
        type: string: {
          default: null
          examples: ["hostname"]
        }
    }
    source: {
      common: false
      description: "The source of events sent to this sink. Typically the filename the logs originated from. Maps to @source in Humio.\n"
      groups: []
      required: false
      warnings: []
        type: string: {
          default: null
          examples: ["{{file}}","/var/log/syslog","UDP:514"]
        }
    }
    token: {
      common: true
      description: "Your Humio ingestion token."
      groups: []
      required: true
      warnings: []
        type: string: {
          examples: ["${HUMIO_TOKEN}","A94A8FE5CCB19BA61C4C08"]
        }
    }
  }
}
