function deleteNode(nodeId){
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this node!",
        icon: "warning",
        showCancelButton : true,
        cancelButtonClass : "btn btn-primary",
        confirmButtonClass : "backdrop d-xl-one",
        buttons: true,
        dangerMode: true,
    })
    .then((result) => {
        if (result.value) {

            $.ajax({
                url : "/nodes/delete2",
                async : true,
                data : {"nodeId" : nodeId},
                type : "DELETE",
                success : function (response) {
                    swal(response, {
                        icon: "success",
                    });

                    $.ajax({
                        url : "/nodes/list"
                    })
                },

                error : function () {
                    swal("Poof! Your imaginary file has been deleted!", {
                        icon: "error",
                    });
                }

            })
        }
    });
}


function deleteNode2(nodeId, nodeName) {
    const swalWithBootstrapButtons = Swal.mixin({
        confirmButtonClass: 'btn btn-danger',
        cancelButtonClass: 'btn btn-success',
        buttonsStyling: false,
    })

    swalWithBootstrapButtons({
        title: 'Are you sure?',
        text: "You want to delete the node of " + nodeName + "!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
            //ajax删除操作
            $.ajax({
                url : "/nodes/delete2",
                async : true,
                data : {"nodeId" : nodeId},
                type : "DELETE",
                success : function () {
                    // //删除成功提示
                    // swalWithBootstrapButtons(
                    //     'Deleted!',
                    //     'The \''+nodeName+'\' has been deleted.',
                    //     'success'
                    // )

                    //刷新页面
                    window.location.reload()
                },

                error : function () {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Delete failed!',
                        'error'
                    )
                }

            })
        }
        // else if (
        //     // Read more about handling dismissals
        //     result.dismiss === Swal.DismissReason.cancel
        // ) {
        //     swalWithBootstrapButtons(
        //         'Cancelled',
        //         'Your imaginary file is safe :)',
        //         'error'
        //     )
        // }
    })
}
