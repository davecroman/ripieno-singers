<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${empty images}">
    <div class="grey-text" style="width:100%;margin:35px auto;text-align:center">
        <i class="fa fa-picture-o fa-5x"></i>
        <div>Sorry, there are no images to show in this tab yet</div>
        <div>We'll be adding them soon!</div>
    </div>
</c:if>

<c:forEach items="${images}" var="image">
    <a class="gallery-item animated fadeIn" href="${image.getUrl()}" title="${image.getCaption()}"
       data-dialog>
        <img class="gallery-image" src="${image.getUrl()}">
        <sec:authorize access="hasRole('ADMIN')">
            <div class="admin-image-panel">
                <div class="admin-image-button" onclick="confirmDelete($(this).closest('a').find('img').attr('src'), ${image.getId()})"><i class="fa fa-times fa-2x"></i></div>
                <div class="admin-image-button"><i class="fa fa-pencil fa-2x"></i></div>
            </div>
        </sec:authorize>
    </a>
</c:forEach>

<script>
    function confirmDelete(imageSrc, imageId){
        console.log(imageSrc);
        $('#imageRemover').removeClass('hide');
        $('#imageToRemove').attr('src', imageSrc);
        $('#image-to-remove-id').val(imageId);
    }
</script>