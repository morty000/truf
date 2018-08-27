package com.ggy.truf.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2017/8/11.
 */
public interface FileService {

    String upload(MultipartFile file, String path);
}
