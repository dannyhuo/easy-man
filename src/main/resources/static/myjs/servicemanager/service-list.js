
function deleteService(serviceId, serviceName) {
    const swalWithBootstrapButtons = Swal.mixin({
        confirmButtonClass: 'btn btn-danger',
        cancelButtonClass: 'btn btn-success',
        buttonsStyling: false,
    })

    swalWithBootstrapButtons({
        title: 'Are you sure?',
        text: "You want to delete the node of " + serviceName + "!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
            //ajax删除操作
            $.ajax({
                url : "/service/delete",
                async : true,
                data : {"serviceId" : serviceId},
                type : "DELETE",
                success : function () {
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
