package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> search(String searchTerm);

    Ad findById(Long id);

    List<Ad> showUserAds(Long id);

    List<Ad> findAdsByCategory(Long id);

    Boolean delete(Long id);

    void update(Ad ad);
}
