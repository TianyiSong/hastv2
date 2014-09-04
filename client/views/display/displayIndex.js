Template.displayIndex.events({
    'keyup #editor-input' : function(event){
        Session.set('editor-content', event.currentTarget.value); 
    }
})

Deps.autorun(function(){
    var markedContent = marked(Session.get('editor-content'));
    $('#preview').html(markedContent);
})

