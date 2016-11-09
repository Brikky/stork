function STAFCheck(ReferenceName) {

    //VITA-2956 Sneha, 26th August,2015.
    var emailexp = /^(?:([A-Za-z0-9]{1}(?!.*__.*)(?!.*_\.)(?!.*\._)(?!.*\.\.)[A-Za-z0-9\._]+[A-Za-z0-9])|([A-Za-z0-9])+)@(?:([A-Za-z0-9]{1,}([\.A-Za-z0-9_]+)*\.[A-Za-z]{2,6})|((\d{1,3}\.){3}\d{1,3}))$/;
    //End VITA-2956 Sneha, 26th August,2015.
    with (document) {
        with (getElementById('STAF_FN_' + ReferenceName)) {
            value = trim(value);
            if (value == '') {
                alert('Please enter your friend\'s name.');
                focus();
                return false;
            }
        }
        with (getElementById('STAF_YN_' + ReferenceName)) {
            value = trim(value);
            if (value == '') {
                alert('Please enter your name.');
                focus();
                return false;
            }
        }
        with (getElementById('STAF_FE_' + ReferenceName)) {
            value = trim(value);
            if (value == '') {
                alert('Please enter your friend\'s email.');
                focus();
                return false;
            }
            if (emailexp.test(value) == false) {
                alert('The e-mail address you have entered for your friend is not valid. Please correct.');
                focus();
                return false;
            }
        }
        with (getElementById('STAF_YE_' + ReferenceName)) {
            value = trim(value);
            if (value == '') {
                alert('Please enter your email.');
                focus();
                return false;
            }
            if (emailexp.test(value) == false) {
                alert('The e-mail address you have entered for yourself is not valid. Please correct.');
                focus();
                return false;
            }
        }
        if (getElementById('STAF_MSG_' + ReferenceName) != null) {
            getElementById('STAF_MSG_' + ReferenceName).value = trim(getElementById('STAF_MSG_' + ReferenceName).value);
        }

        with (getElementById('STAF_BD_' + ReferenceName)) {
            value = trim(value);
            if (value == '') {
                alert('Please enter the code exactly as shown.');
                focus();
                return false;
            }
        }
    }
    return true;
}

function STAFClear(ReferenceName) {
    with (document) {
        getElementById('STAF_FN_' + ReferenceName).value = '';
        getElementById('STAF_YN_' + ReferenceName).value = '';
        getElementById('STAF_FE_' + ReferenceName).value = '';
        getElementById('STAF_YE_' + ReferenceName).value = '';
        if (getElementById('STAF_MSG_' + ReferenceName) != null) {
            getElementById('STAF_MSG_' + ReferenceName).value = '';
        }
        if (getElementById('STAF_BD_' + ReferenceName) != null) {
            getElementById('STAF_BD_' + ReferenceName).value = '';
        }
    }
}
