const DEFAULT = {
  url: '',
  type: 'GET',
  cache: true,
  data: {},
}

window.ajax = {
  sendForm: (path, data, success, error) => {
    let sendFromResult;
    let url = window.location.origin;
    if (path.startsWith('http')) {
      url = path;
    } else if (path.startsWith('/')) {
      url += path;
    } else {
      url += '/' + path;
    }

    $.ajax({
      url,
      enctype: 'multipart/form-data',
      type: 'POST',
      cache: false,
      processData: false,
      contentType: false,
      data: data,
      success: result => {
        success(result);

      },
      error: (request) => {
        error(request);
      },
    });
  },

  request: (path, options, success, error) => {
    var url = window.location.origin;
    if (path.startsWith('http')) {
      url = path;
    } else if (path.startsWith('/')) {
      url += path;
    } else {
      url += '/' + path;
    }

    if (options.data && (options.type === 'POST' || options.type
        === 'DELETE' || options.type === 'PUT' )) {
      options.data = JSON.stringify(options.data);
    }
    $.ajax({
      ...DEFAULT,
      ...options,
      url,
      beforeSend: xhr => {
        xhr.setRequestHeader("Content-Type",
            "application/json;charset=UTF-8");
      },
      success: result => {
        success(result);
      },
      error: (request) => {
        error(request);
      },
    })
  }
}