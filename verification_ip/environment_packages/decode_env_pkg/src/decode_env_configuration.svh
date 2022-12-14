import uvmf_base_pkg::*;
class decode_env_configuration extends uvm_object;
    `uvm_object_utils(decode_env_configuration)

    decode_in_configuration cfg_i;
    decode_out_configuration cfg_o;

    function new(string name = "decode_env_configuration");
        super.new(name);
        cfg_i = decode_in_configuration::type_id::create("cfg_i");
        cfg_o = decode_out_configuration::type_id::create("cfg_o");
    endfunction

    virtual function void initialize(string agent_path[],
                                    string interface_name[],
                                    uvmf_active_passive_t activity[]);
        cfg_i.initialize(activity[0], agent_path[0], interface_name[0]);
        cfg_i.initiator_responder = INITIATOR;
        cfg_o.initialize(activity[0], agent_path[1], interface_name[1]);
        cfg_o.initiator_responder = RESPONDER;

        uvm_config_db #(decode_env_configuration)::set(null, agent_path[0], UVMF_AGENT_CONFIG, this);
        uvm_config_db #(decode_env_configuration)::set(null, agent_path[1], UVMF_AGENT_CONFIG, this);
    endfunction

endclass