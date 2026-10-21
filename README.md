Step 11 -- Sequence Workflow


{
  "nodes": [
    {
      "node_id": "N1",
      "activity_verb": "submit registration pack",
      "governed_activity": "commit",
      "performing_element": "supplier"
    },
    {
      "node_id": "N2",
      "activity_verb": "receive registration pack",
      "governed_activity": "commit",
      "performing_element": "Email-calendar"
    },
    {
      "node_id": "N3",
      "activity_verb": "store registration pack PDF and spreadsheet",
      "governed_activity": "commit",
      "performing_element": "PDF-DMS"
    },
    {
      "node_id": "N4",
      "activity_verb": "retrieve registration pack",
      "governed_activity": "retrieve",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N5",
      "activity_verb": "check pack completeness",
      "governed_activity": "interpret",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N6",
      "activity_verb": "decide pack completeness status",
      "governed_activity": "decide",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N7",
      "activity_verb": "retrieve trade licence details from pack",
      "governed_activity": "retrieve",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N8",
      "activity_verb": "retrieve registry record",
      "governed_activity": "retrieve",
      "performing_element": "External site"
    },
    {
      "node_id": "N9",
      "activity_verb": "verify trade licences",
      "governed_activity": "interpret",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N10",
      "activity_verb": "decide pack approval for vendor creation",
      "governed_activity": "decide",
      "performing_element": "Procurement analyst"
    },
    {
      "node_id": "N11",
      "activity_verb": "create vendor record",
      "governed_activity": "commit",
      "performing_element": "ERP"
    },
    {
      "node_id": "N12",
      "activity_verb": "retrieve vendor master record",
      "governed_activity": "retrieve",
      "performing_element": "ERP"
    },
    {
      "node_id": "N13",
      "activity_verb": "return incomplete pack",
      "governed_activity": "notify",
      "performing_element": "Email-calendar"
    },
    {
      "node_id": "N14",
      "activity_verb": "notify supplier of vendor creation",
      "governed_activity": "notify",
      "performing_element": "Email-calendar"
    }
  ],
  "edges": [
    {
      "from_node": "N1",
      "to_node": "N2",
      "data_class": "registration pack",
      "business_object": "registration pack"
    },
    {
      "from_node": "N2",
      "to_node": "N3",
      "data_class": "registration pack",
      "business_object": "registration pack"
    },
    {
      "from_node": "N3",
      "to_node": "N4",
      "data_class": "registration pack",
      "business_object": "registration pack"
    },
    {
      "from_node": "N4",
      "to_node": "N5",
      "data_class": "registration pack",
      "business_object": "registration pack"
    },
    {
      "from_node": "N5",
      "to_node": "N6",
      "data_class": "pack completeness assessment",
      "business_object": ""
    },
    {
      "from_node": "N6",
      "to_node": "N7",
      "data_class": "incomplete pack decision",
      "business_object": ""
    },
    {
      "from_node": "N7",
      "to_node": "N8",
      "data_class": "trade licence",
      "business_object": "trade licence"
    },
    {
      "from_node": "N8",
      "to_node": "N9",
      "data_class": "registry record",
      "business_object": "registry record"
    },
    {
      "from_node": "N9",
      "to_node": "N10",
      "data_class": "licence verification result",
      "business_object": ""
    },
    {
      "from_node": "N10",
      "to_node": "N11",
      "data_class": "approved supplier details",
      "business_object": ""
    },
    {
      "from_node": "N11",
      "to_node": "N12",
      "data_class": "vendor record",
      "business_object": "vendor record"
    },
    {
      "from_node": "N6",
      "to_node": "N13",
      "data_class": "incomplete pack decision",
      "business_object": ""
    },
    {
      "from_node": "N13",
      "to_node": "N1",
      "data_class": "returned registration pack",
      "business_object": "registration pack"
    },
    {
      "from_node": "N12",
      "to_node": "N14",
      "data_class": "vendor master record",
      "business_object": "vendor master record"
    }
  ],
  "merged_duplicate_nodes": [],
  "unlisted_performer_nodes": [
    "N1"
  ]
}




Step 16 -- classify Determinism

{
  "step_tiers": [
    {
      "node_id": "N1",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N2",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N3",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N4",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N5",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N6",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N7",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N8",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N9",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N10",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N11",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N12",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N13",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    },
    {
      "node_id": "N14",
      "tier": "D0",
      "irreducible": false,
      "necessity_rationale": ""
    }
  ],
  "containment": [
    {
      "node_id": "N1",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N2",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N3",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N4",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N5",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N6",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N7",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N8",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N9",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N10",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N11",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N12",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N13",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    },
    {
      "node_id": "N14",
      "input_bounded": true,
      "output_bounded": true,
      "neighbours": [],
      "position_relative_to_commit": ""
    }
  ],
  "governance_tier": "deterministic"
}
