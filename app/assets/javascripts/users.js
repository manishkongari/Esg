
$(function () {
    $('#project_qcdate').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',

    });
    $('#project_shipdate').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',

    });

    $('#project_podate').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',

    });


    //validate



    $("#component_details").validate({
        rules: {

            "component[partno][]": {
                required: true
            },
            "component[desc][]": {
                required: true
            },
            "component[manuf][]": {
                required: true
            },
            "component[qty][]": {
                required: true
            }

        }});
    $("#project_details").validate({
        rules: {

            "project[projectname]": {
                required: true
            },
            "project[priority]": {
                required: true
            },
            "project[contract]": {
                required: true
            },
            "project[salescontact]": {
                required: true
            },
            "project[engineer]": {
                required: true
            },
            "project[podate]": {
                required: true
            },
            "project[buildready]": {
                required: true
            },
            "project[qcdate]": {
                required: true
            },
            "project[shipdate]": {
                required: true
            },
            "project[mtdr]": {
                required: true
            },
            "project[quicknote]": {
                required: true

            }
        }
    });



});