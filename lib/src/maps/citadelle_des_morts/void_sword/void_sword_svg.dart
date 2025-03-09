const String voidSwordSvgTemplate = '''
<svg viewBox="0 0 120 120" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:serif="http://www.serif.com/" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5">
  <circle style="pointer-events:none" cx="59.988" cy="60" r="57.708"></circle>
  <g id="outer" transform="rotate({outerRotation} 60 60)">
    <path id="_12" serif:id="12" d="M23.904 24.858l.311.26c.596.497 1.31.991 2.137 1.481.831.49 1.549.842 2.154 1.056 1.314.462 2.151.478 2.512.046.16-.192.208-.419.14-.682-.069-.262-.237-.504-.508-.731-.358-.298-.821-.492-1.395-.579l.392-.469c.6.116 1.079.324 1.437.623.371.309.589.671.657 1.089.069.418-.03.791-.298 1.112-.434.52-1.15.667-2.158.445-1.002-.22-2.132-.775-3.393-1.666l-.065.079c1.09 1.043 1.836 2.05 2.24 3.014s.387 1.711-.047 2.231c-.268.321-.613.484-1.034.494-.419.011-.814-.138-1.185-.448-.36-.3-.653-.737-.881-1.308l.393-.471c.22.571.5 1 .846 1.289.276.23.549.356.819.382.269.021.486-.065.65-.261.349-.419.207-1.2-.425-2.339-.322-.582-.812-1.25-1.465-2.01-.652-.756-1.296-1.399-1.93-1.928l-.292-.244.388-.465z" style="fill:#0bfeea"></path>
    <path id="_11" serif:id="11" d="M13.779 43.15c-.112-.505-.082-.909.093-1.212.151-.261.365-.432.643-.51.277-.076.543-.041.798.106.341.197.788.694 1.342 1.491l.425.61c.329.471.635.788.915.95.358.207.704.269 1.041.186.34-.082.607-.296.805-.64.186-.322.238-.637.162-.947-.081-.311-.277-.556-.591-.738-.29-.167-.683-.271-1.178-.309l-.296-.022c-.49-.036-.824-.105-1.007-.211-.289-.167-.479-.425-.567-.768-.089-.344-.046-.667.127-.966.178-.307.437-.508.778-.598.342-.092.668-.047.979.133.299.173.498.428.591.768.094.338.056.656-.114.95-.062.108-.149.215-.263.32.512.023.919.121 1.222.296.394.227.641.558.738.993.098.439.022.872-.226 1.302-.273.471-.63.77-1.072.897-.442.124-.893.054-1.352-.211-.228-.131-.412-.268-.549-.412-.139-.142-.348-.414-.627-.811l-.314-.443c-.557-.787-.943-1.246-1.167-1.375-.164-.095-.327-.124-.489-.086-.163.035-.289.131-.377.282-.115.2-.134.496-.055.884l-.415.091zm4.283-3.132c-.224-.128-.457-.162-.697-.101-.238.062-.422.2-.548.419-.124.215-.151.441-.085.681.067.241.21.425.429.551.224.129.455.161.695.101.239-.064.423-.203.549-.422.124-.214.151-.441.085-.681-.068-.238-.209-.421-.428-.548z" style="fill:#0bfeea"></path>
    <path id="_10" serif:id="10" d="M17.57 57.897l-.7 2.811-.566-.131.509-2.05-3.415 1.46.683 1.605-.536.228-.681-1.608-2.357.995-.22-.52 2.354-1-.679-1.606.531-.231.681 1.608 3.418-1.452-1.826-1.053.298-.499 2.506 1.443z" style="fill:#0bfeea"></path>
    <path id="_9" serif:id="9" d="M30.989 92.049l-.253.278c-.384-.2-.725-.403-1.019-.612l-2.621 2.884c.263.287.501.604.713.949l-.254.28c-.374-.592-.924-1.219-1.65-1.879-.728-.661-1.404-1.148-2.03-1.464l.255-.28c.365.18.704.387 1.014.62l2.621-2.884c-.236-.272-.471-.592-.708-.957l.253-.279c.433.668.979 1.298 1.637 1.896s1.338 1.082 2.042 1.448zm-1.625-.618c-.211-.153-.433-.337-.67-.551-.236-.215-.44-.419-.612-.615L25.5 93.106c.184.146.403.333.658.565.257.233.464.433.625.601l2.581-2.841z" style="fill:#0bfeea"></path>
    <path id="_8" serif:id="8" d="M45.627 101.777l-2.187.224.078-1.017-1.693.173.081-1.014-1.695.172.118-1.495.415.027-.086 1.012 1.699-.17-.081 1.014 1.688-.175-.079 1.016 1.7-.17.042.403zm-1.17 2.236-2.188.226.077-1.017-1.695.172.082-1.014-1.693.173.118-1.495.415.027-.086 1.012 1.701-.169-.081 1.015 1.688-.176-.083 1.014 1.699-.17.046.402z" style="fill:#0bfeea"></path>
    <path id="_7" serif:id="7" d="M57.488 106.192l.014-.458 4.953.154-.014.459-4.953-.155zm2.014-1.747-.014.429-1.957-.061.014-.461 1.373.043c-.243-.262-.358-.552-.348-.869.013-.394.17-.726.47-1.001.301-.275.652-.406 1.055-.394.402.013.744.166 1.027.459.285.293.419.635.407 1.029-.01.316-.143.598-.401.845l1.37.043-.014.46-1.958-.061.013-.428c.34-.205.516-.489.528-.851.008-.275-.086-.512-.279-.715-.196-.206-.431-.312-.707-.32-.28-.009-.522.082-.728.275-.205.191-.314.422-.322.697-.011.362.145.656.471.881z" style="fill:#0bfeea"></path>
    <path id="_6" serif:id="6" d="M91.188 94.802l-.348-.298c.881-.408 1.59-.929 2.126-1.555.352-.41.585-.789.698-1.138-.222.092-.433.125-.629.098s-.38-.112-.55-.258c-.224-.192-.346-.437-.368-.737-.023-.296.064-.56.256-.783.191-.224.434-.346.729-.37.295-.021.553.061.778.254.356.305.467.777.329 1.415-.137.639-.487 1.286-1.049 1.943-.488.568-1.143 1.046-1.972 1.429zm1.483-3.366c.163.14.354.201.575.182.219-.017.401-.11.542-.274.142-.167.204-.358.19-.571-.016-.214-.107-.392-.273-.534-.169-.145-.362-.21-.58-.195s-.398.105-.54.272c-.144.167-.206.36-.19.579.017.217.108.398.276.541zm-.32-2.731.348.298c-.883.41-1.591.928-2.129 1.556-.351.409-.585.789-.698 1.141.225-.095.436-.128.63-.1.197.025.38.112.551.259.223.191.346.435.369.734.022.299-.064.56-.257.785-.192.224-.433.347-.728.369-.293.022-.553-.062-.777-.253-.357-.306-.47-.779-.332-1.418.136-.637.487-1.286 1.05-1.942.487-.569 1.144-1.045 1.973-1.429zm-1.483 3.366c-.165-.14-.356-.202-.576-.183-.22.02-.402.113-.544.279s-.205.356-.189.57c.016.213.108.391.274.533.169.145.363.209.581.194.217-.014.397-.106.54-.272.142-.166.206-.36.188-.578-.017-.22-.108-.4-.274-.543z" style="fill:#0bfeea"></path>
    <path id="_5" serif:id="5" d="M102.837 79.98l-2.755-1.085c-.458-.181-.872-.219-1.234-.112l.163-.414c.281-.058.572-.057.877.003-.256-.242-.448-.493-.582-.752l.072-.402c.273-.094.608-.089 1.006.013-.234-.201-.44-.462-.617-.78l.074-.41c.363-.097.737-.069 1.121.082l2.405.947c.252.1.427.158.522.177.098.017.19.008.281-.026.159-.064.289-.226.391-.483l.093-.236-.387-.153.793-.393.29.82-.375-.148-.139.353c-.133.338-.318.547-.555.629-.239.083-.552.049-.943-.105l-2.326-.916c-.392-.155-.695-.21-.911-.164.22.419.556.784 1.012 1.093l2.332.918-.152.386-2.599-1.024c-.468-.184-.817-.257-1.048-.217.203.399.513.752.925 1.06l2.418.953-.152.386z" style="fill:#0bfeea"></path>
    <path id="_4" serif:id="4" d="M104.736 60.646c.3.004.616.127.947.364.332.239.629.555.892.953l-.009.67c-.553-.91-1.165-1.367-1.838-1.375l-.016 1.306-.272-.004.016-1.306c-.585.048-1.158.491-1.717 1.331l.008-.633c.502-.771 1.074-1.207 1.717-1.309l.015-1.267c-.639-.121-1.201-.571-1.683-1.351l.008-.633c.538.854 1.099 1.31 1.683 1.373l.016-1.306.273.003-.017 1.306c.673.009 1.296-.433 1.872-1.329l-.009.667c-.271.394-.577.703-.914.934-.337.228-.656.344-.956.34l-.016 1.266z" style="fill:#0afeeb"></path>
    <path id="_3" serif:id="3" d="M94.492 29.315l-.151.111c-.282.209-.639.549-1.08 1.025-.439.477-.708.816-.805 1.017-.139.286-.116.555.072.809l.06.082-.355.263-.239-.323c-.224-.304-.26-.6-.109-.892.184-.349.566-.824 1.145-1.428-.853.377-1.646.543-2.383.496l-.532-.49c.213-.374.603-.841 1.17-1.403l.469-.47c.166-.162.284-.276.355-.342.291-.268.497-.49.62-.661-.737.115-1.288-.073-1.651-.564-.218-.295-.301-.624-.251-.98.048-.358.219-.645.51-.859.31-.229.655-.321 1.024-.271.374.05.671.227.893.528.304.412.41.889.319 1.432.74-.206 1.251-.284 1.534-.234.284.05.567.267.85.65l.29.392-.36.266-.135-.183c-.274-.37-.537-.569-.791-.598-.25-.028-.774.083-1.568.337-.099.222-.195.394-.287.508-.092.114-.313.338-.666.671l-.745.721c-.492.473-.805.834-.938 1.082.472.031 1.024-.047 1.653-.236.631-.186 1.14-.426 1.531-.715l.233-.172.318.431zm-1.356-2.746c.116-.568.055-1.016-.181-1.335-.159-.215-.368-.34-.625-.373-.255-.035-.497.034-.721.2-.2.147-.322.344-.362.586-.04.239.013.46.158.656.314.424.892.513 1.731.266z" style="fill:#0bfeea"></path>
    <path id="_2" serif:id="2" d="M79.061 19.508l1.695-2.897.464.271-1.964 3.355c-.272.465-.393.963-.36 1.49l-.489-.287c-.034-.338.027-.713.18-1.122-.382.293-.742.49-1.08.596l-.504-.181c-.051-.388.025-.82.228-1.294-.301.271-.682.488-1.137.648l-.498-.177c-.048-.495.053-.952.3-1.374l.514-.879c-.33.279-.627.479-.881.596l-.465-.083c-.032-.702.118-1.334.447-1.896.261-.447.604-.806 1.029-1.083.426-.276.936-.466 1.526-.575.122-.293.142-.693.062-1.201l.544.319c.035.243.023.532-.036.866.384.005.806.098 1.265.277l-.232.396c-.443-.152-.835-.223-1.176-.222-.085.219-.186.429-.305.632l-1.644 2.809c-.268.458-.406.842-.41 1.155.534-.161 1.067-.517 1.597-1.063l1.632-2.788.466.272-1.803 3.081c-.335.574-.499 1.013-.496 1.314.538-.185 1.047-.503 1.531-.955zm-1.156-4.405c-.434.117-.807.294-1.128.53-.318.237-.582.534-.788.887-.217.37-.346.777-.388 1.219.396-.148.804-.417 1.23-.801l1.074-1.835z" style="fill:#0bfeea"></path>
    <path id="_1" serif:id="1" d="M60.962 15.134c.228.089.41.204.553.342.141.138.298.36.469.67l.205.367c.251.45.538.675.855.675h.093v.383h-.254c-.451.0.86-.317-1.227-.948l-.279-.49c-.189-.322-.384-.547-.589-.675-.205-.13-.471-.194-.801-.194-.331.0-.597.064-.802.194-.205.128-.4.353-.587.675l-.284.49c-.364.631-.773.948-1.221.948h-.254v-.383h.09c.32.0.607-.225.858-.675l.204-.367c.172-.31.328-.532.469-.67.144-.138.328-.253.553-.342-.394-.217-.696-.498-.911-.838-.216-.34-.321-.715-.321-1.119.0-.587.218-1.098.656-1.532.441-.434.955-.652 1.55-.652.594.0 1.108.218 1.549.652.44.434.661.945.661 1.532.0.404-.108.779-.323 1.119s-.517.621-.912.838zm-.975-3.627c-.467.0-.864.161-1.196.488-.331.322-.497.712-.497 1.17.0.465.166.86.494 1.185.328.327.727.488 1.199.488.468.0.868-.161 1.201-.488.327-.325.494-.72.494-1.185.0-.458-.167-.848-.497-1.17-.33-.327-.73-.488-1.198-.488z" style="fill:#0bfeea"></path>
    <path d="M66.534 100.652 60 117.72l-6.709-17.04c2.11.334 4.505.508 6.709.508 2.12.0 4.5-.227 6.534-.536zm-30.778-7.344-16.575 7.523 7.336-16.768c2.771 3.98 5.27 6.459 9.239 9.245zM22.149 76.237c.159.632.244 1.293.244 1.974.0 4.458-3.62 8.077-8.078 8.077-4.458.0-8.078-3.619-8.078-8.077.0-4.459 3.62-8.078 8.078-8.078 3.022.0 5.658 1.663 7.044 4.123.246.669.51 1.329.79 1.981zm-2.826-9.901-17.043-6.772 17.024-6.015c-.419 2.355-.48 3.988-.48 6.463.0 2.408.102 4.029.499 6.324zm7.308-30.376-7.634-16.216 16.971 6.85c-3.726 2.716-6.704 5.578-9.337 9.366zM42.74 22.623c-.782.253-1.616.389-2.482.389-4.458.0-8.078-3.619-8.078-8.077.0-4.459 3.62-8.078 8.078-8.078 4.458.0 8.078 3.619 8.078 8.078.0 3.016-1.658 5.649-4.111 7.036-.5.208-.995.425-1.485.652zm10.822-3.325 6.953-17.006 6.061 17.152c-2.299-.399-4.163-.607-6.576-.607-2.439.0-4.115.054-6.438.461zm30.26 7.34 17.341-7.093-7.848 16.391c-2.778-3.742-5.628-6.682-9.493-9.298zm13.355 15.664c-.132-.58-.202-1.184-.202-1.804.0-4.458 3.619-8.078 8.077-8.078 4.459.0 8.078 3.62 8.078 8.078.0 4.458-3.619 8.078-8.078 8.078-2.787.0-5.247-1.416-6.699-3.566-.36-.919-.753-1.822-1.176-2.708zm3.518 11.407 17.013 6.303-17.034 6.443c.33-2.1.502-4.251.502-6.443.0-2.143-.164-4.248-.481-6.303zm-7.294 30.439 7.511 16.752-16.791-7.569c3.795-2.696 6.587-5.385 9.28-9.183zm-16.264 13.31c.631-.159 1.292-.243 1.972-.243 4.458.0 8.078 3.619 8.078 8.078.0 4.458-3.62 8.077-8.078 8.077s-8.077-3.619-8.077-8.077c0-2.905 1.536-5.453 3.84-6.877.766-.297 1.521-.617 2.265-.958z" style="fill:none;stroke:#4f4f4f;stroke-width:.96px"></path>
    <path d="M49.996 99.959l-12.33 13.265.619-18.219c1.817 1.124 3.745 2.122 5.778 2.974 1.955.821 3.938 1.479 5.933 1.98zM19.852 50.825 6.783 37.682l18.64-.046c-1.298 2.01-2.438 4.16-3.396 6.443-.932 2.22-1.654 4.476-2.175 6.746zm49.242-30.977 13.24-13.072-.115 18.565c-1.966-1.257-4.066-2.364-6.291-3.298-2.249-.944-4.534-1.672-6.834-2.195zm30.865 50.098 13.249 12.395-18.2-.651c1.117-1.808 2.108-3.725 2.956-5.746.829-1.976 1.492-3.981 1.995-5.998z" style="fill:none;stroke:#222;stroke-width:.96px"></path>
  </g>
  <g id="inner" transform="rotate({innerRotation} 60 60)">
    <path id="_41" serif:id="4" d="M29.718 60.253l-5.569 4.176v-8.352l5.569 4.176z" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
    <g id="_31" serif:id="3">
      <path d="M59.837 96.7l-4.176-5.568h8.352L59.837 96.7z" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
      <path d="M64.013 94.169h-7.846" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
    </g>
    <g id="_21" serif:id="2">
      <path d="M90.336 60.253l5.568-4.176v8.352l-5.568-4.176z" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
      <path d="M92.867 64.429v-7.846" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
    </g>
    <path id="_13" serif:id="1" d="M59.837 24.819l4.176 5.568h-8.352l4.176-5.568z" style="fill:none;stroke:#3fff09;stroke-width:.86px"></path>
    <path d="M19.038 19.356l-.226-.532.535.223c-.104.102-.207.205-.309.309zm16.876 7.239 12.228 4.44-5.096 12.366-11.689 4.986L26.7 35.712c2.957-3.827 5.402-6.206 9.214-9.117zM19.32 53.521l12.037-5.134 4.888 11.517-4.692 11.385-12.271-5.052c-.309-2.034-.47-4.117-.47-6.237.0-2.204.174-4.368.508-6.479zm2.264 21.351c.428.692.754 1.454.958 2.265-.341-.744-.661-1.499-.958-2.265zm5.066 9.26 4.903-12.843 11.539 4.75 5.321 12.541-12.603 4.631c-3.798-2.693-6.464-5.284-9.16-9.079zm26.764 16.577-5.001-12.129 12.56-5.179 10.68 4.397-5.101 12.84c-2.055.316-4.421.538-6.564.538-2.192.0-4.475-.136-6.574-.467zm21.576-2.356c.811-.547 1.725-.951 2.708-1.176-.886.423-1.789.816-2.708 1.176zm9.25-5.061-12.587-5.494 4.416-10.622 13.25-5.465 4.005 12.461c-2.616 3.865-5.341 6.342-9.084 9.12zm16.448-26.768-11.369 5.187-5.534-13.097 4.516-10.861 12.295 5.756c.408 2.323.567 4.052.567 6.491.0 2.413-.076 4.224-.475 6.524zM66.523 19.281 72.118 31l-11.883 5.069-12.093-5.034 5.419-11.661c2.295-.397 4.019-.55 6.427-.55 2.475.0 4.18.038 6.535.457zm-20.779 2.078c-.615.346-1.28.614-1.981.79.652-.28 1.312-.544 1.981-.79zm52.285 22.866c-.265-.468-.484-.965-.652-1.485.227.49.444.985.652 1.485zm-4.75-8.447-4.978 11.975-11.048-4.6L72.118 31l11.943-4.28c3.789 2.633 6.502 5.332 9.218 9.058z" style="fill:none;stroke:#4f4f4f;stroke-width:.96px"></path>
  </g>
  <g>
    <circle cx="59.988" cy="60" r="41.176" style="fill:none;stroke:#bebebe;stroke-width:.96px"></circle>
    <circle cx="59.988" cy="60" r="57.708" style="fill:none;stroke:#fff;stroke-width:1.92px"></circle>
    <path d="M59.988 32.307l19.403 8.037 8.037 19.403-8.037 19.403-19.403 8.037-19.403-8.037-8.037-19.403 8.037-19.403 19.403-8.037z" style="stroke:#bebebe;stroke-width:1.92px"></path>
  </g>
  <path id="point" d="M59.837 110.545l3.856 11.516h-7.712l3.856-11.516z" style="fill:#40fe0b;stroke:#3fff09;stroke-width:.86px"></path>
</svg>
''';