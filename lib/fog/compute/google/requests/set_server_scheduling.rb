module Fog
  module Compute
    class Google
      class Mock
        def set_server_scheduling(_identity, _zone, _on_host_maintenance, _automatic_restart, _preemptible, _provisioning_model)
          # :no-coverage:
          Fog::Mock.not_implemented
          # :no-coverage:
        end
      end

      class Real
        def set_server_scheduling(identity, zone, on_host_maintenance: nil, automatic_restart: nil, preemptible: nil, provisioning_model: nil)
          scheduling = ::Google::Apis::ComputeV1::Scheduling.new
          scheduling.on_host_maintenance = on_host_maintenance unless on_host_maintenance.nil?
          scheduling.automatic_restart = automatic_restart unless automatic_restart.nil?
          scheduling.preemptible = preemptible unless preemptible.nil?
          scheduling.provisioning_model = provisioning_model unless provisioning_model.nil?
          zone = zone.split("/")[-1]
          @compute.set_instance_scheduling(@project, zone, identity, scheduling)
        end
      end
    end
  end
end
